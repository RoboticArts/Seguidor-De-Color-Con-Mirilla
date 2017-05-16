#include "mainwindow.h"
#include "ui_mainwindow.h"

#include<QtCore>
#include<QMessageBox>
#include <qfiledialog.h>


//Valores del objeto mínimo a detectar
#define MIN_OBJECT_X 100
#define MIN_OBJECT_Y 100

//Resolucion de la camara
#define CAMERA_WIDHT 640
#define CAMERA_HEIGHT 480

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    frameTimer = new QTimer(this);

    //Se muestra un icono cuando no hay cámara
    QPixmap pixmap( ":digital-camera-icon.png" );
    ui -> LabelCapture -> setPixmap(pixmap);
    ui -> LabelCapture->setAlignment(Qt::AlignCenter);

    /*
    capwebcam.open(0);
    capwebcam.set(CV_CAP_PROP_FRAME_WIDTH, CAMERA_WIDHT);
    capwebcam.set(CV_CAP_PROP_FRAME_HEIGHT,CAMERA_HEIGHT);
    frameTimer->start(30);
    */



    connect(frameTimer, SIGNAL(timeout()), this, SLOT(processFrameAndUpdateGUI())); //Captura, analiza y muetra por pantalla el frame
    //Para no saturar el puerto serie, se enviará un nuevo valor cuando se añada un nuevo valor EditTextPlain
    //connect(ui->plainTextEditCamera, SIGNAL(textChanged(), SLOT(escribirPuertoSerie))

   connect(ui->pushButtonOpenCloseCamera, SIGNAL(clicked(bool)), this, SLOT(OpenCloseCamera())); //Enciende o apaga el modo automatico


}

MainWindow::~MainWindow()
{
    delete ui;
}

//http://opencv-srf.blogspot.com.es/2010/09/object-detection-using-color-seperation.html
/*
Orange  0-22
Yellow 22- 38
Green 38-75
Blue 75-130
Violet 130-160
Red 160-179
*/

void MainWindow::processFrameAndUpdateGUI()
{
    capwebcam.read(img);

    //cv::cvtColor(matOrg, matOrg,CV_BGR2RGB);
    cv::cvtColor(img, hsv, CV_BGR2HSV);

    // El valor que determina el color es el primer argumento, en este caso es azul 75-130
    cv::inRange(hsv, cv::Scalar(75, 50, 50), cv::Scalar(130, 255, 255), binary);

    cv::Mat element = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(15, 15));
    cv::erode(binary, binary, element);
    cv::dilate(binary, binary, element);

    std::vector< std::vector<cv::Point> > contours;
    findContours(binary, contours, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE);

    drawContours(binary, contours, -1, cv::Scalar(255), CV_FILLED);


    for (std::vector<cv::Point> contour : contours) {


        // dibujar rectangulo
        cv::Rect r = boundingRect(contour);

        if(r.width >= MIN_OBJECT_X && r.height >= MIN_OBJECT_Y) //FILTRO: Solo se mostrará el rectangulo y se enviará infomracion si es mas grande que 100x100 pixeles
        {
                rectangle(img, r, CV_RGB(255, 0, 0), 2, CV_AA, 0);

                cv::Point center(r.x + (r.width / 2), r.y + (r.height / 2));

                std::ostringstream str;
                str << center.x << "," << center.y;

                position =  "X" + QString::number(center.x) + " Y" + QString::number(center.y) + "\n";
                EditPlainTextCamera(position); // Escribe por el Text Edit y despues se envia por BT


                // mostrar texto (x, y) Se obtienen las coordenadas en pixeles del punto medio del cuadrado rojo creado respecto de la pantalla 640x480px
                cv::putText(img, str.str(), center, cv::FONT_HERSHEY_COMPLEX_SMALL, 0.60, CV_RGB(0, 255, 0), 1, CV_AA);
        }
     }


    cv::cvtColor(img, img, CV_BGR2RGB); //Se pasa de BGR (que es como lee openCV a RGB (que es como funciona QImage)
    imageNormal=QImage((uchar*)img.data, img.cols, img.rows, img.step, QImage::Format_RGB888);
    imageBinary=QImage((uchar*)binary.data, binary.cols, binary.rows, binary.step, QImage::Format_Indexed8);

    //Se muestra por pantalla los dos vídeos
    ui -> LabelCapture -> setPixmap(QPixmap::fromImage(imageNormal));

    //Para ver la imagen en binario crear un LabelText con:
    // Nombre: LabelBinary  autoFillBackground: activado   frameShape: box
    //ui -> LabelBinary -> setPixmap(QPixmap::fromImage(imageBinary));

}


void MainWindow::closeEvent (QCloseEvent *event)
{

    QMessageBox::StandardButton resBtn = QMessageBox::question( this, "OPENCV","¿Quieres salir?",QMessageBox::Cancel | QMessageBox::No | QMessageBox::Yes,QMessageBox::Yes);
    if (resBtn != QMessageBox::Yes)
    {

        event->ignore();
    }
    else
    {

        exitProgram();
        event->accept();
    }
}

void MainWindow::exitProgram()
{

    if (capwebcam.isOpened())
        {
            capwebcam.release();
        }


    if(frameTimer->isActive()) frameTimer->stop();


    QApplication::quit();
}


void MainWindow::EditPlainTextCamera(QString position){

     ui->plainTextEditCamera->insertPlainText(position);

     // Autoscroll
     ui -> plainTextEditCamera -> moveCursor(QTextCursor::End);
     ui -> plainTextEditCamera -> ensureCursorVisible();
}



void MainWindow::OpenCloseCamera()
{
    QString text = ui -> labelInformationServerClient -> text(); // El label se usaba para el modo servidor/cliente, pero se usara para todos los modos. Se cambiará

    //SE ENCEINDE EL SISTEMA
    if(text == "Modo: Sin conexión")
    {
        capwebcam.open(0);
        if (!capwebcam.isOpened()) //Si no hay camara o no se detecta, NO ENCIENDE el sistema
        {
            QMessageBox::information(this,"CamInfo","Cámara no detectada");
            return;
        }

        ui -> labelInformationServerClient -> setText("Modo: Automatico");

        //Se carga la imagen de la mirilla
        QPixmap pixmap( ":plantilla-mirilla-real.png" );
        ui -> LabelCaptureMask -> setPixmap(pixmap);
        ui -> LabelCaptureMask->setAlignment(Qt::AlignCenter);

        //Se enciende la camara
        frameTimer->start(30);

        capwebcam.set(CV_CAP_PROP_FRAME_WIDTH, CAMERA_WIDHT);
        capwebcam.set(CV_CAP_PROP_FRAME_HEIGHT,CAMERA_HEIGHT);
    }

    //SE APAGA EL SISTEMA
    if(text == "Modo: Automatico")
    {
        //Se cambia a modo sin conexion
        ui -> labelInformationServerClient -> setText("Modo: Sin conexión");

        //Se sustituye la imagen por un icono
        QPixmap pixmap( ":digital-camera-icon.png" );
        ui -> LabelCapture->setAlignment(Qt::AlignCenter);
        ui -> LabelCapture -> setPixmap(pixmap);
        ui -> LabelCaptureMask -> clear(); //Se hace transparente la mascara

        //Para el timer
        frameTimer -> stop();

        //Y si la camara estaba encendida, la apaga
        if (capwebcam.isOpened())
            {
                capwebcam.release();
            }

    }

}

