#-------------------------------------------------
#
# Project created by QtCreator 2017-05-16T01:42:05
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = WidgetOpenCV
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += main.cpp\
        mainwindow.cpp

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_contrib249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_contrib249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_contrib249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_core249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_core249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_core249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_features2d249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_features2d249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_features2d249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_flann249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_flann249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_flann249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_gpu249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_gpu249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_gpu249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_highgui249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_highgui249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_highgui249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_imgproc249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_imgproc249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_imgproc249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_legacy249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_legacy249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_legacy249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2





win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ml249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ml249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ml249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_nonfree249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_nonfree249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_nonfree249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_objdetect249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_objdetect249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_objdetect249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ocl249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ocl249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ocl249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ocl249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ocl249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ocl249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_photo249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_photo249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_photo249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_stitching249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_stitching249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_stitching249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_superres249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_superres249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_superres249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ts249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ts249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_ts249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_video249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_video249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_video249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_videostab249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_videostab249d
else:unix: LIBS += -L$$PWD/../../../../opencv/build/x86/vc11/lib/ -lopencv_videostab249

INCLUDEPATH += $$PWD/../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../opencv/build/include/opencv2


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../../../opencv/build/x86/vc11/lib/ -lopencv_calib3d249
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../../../opencv/build/x86/vc11/lib/ -lopencv_calib3d249d
else:unix: LIBS += -L$$PWD/../../../../../../../opencv/build/x86/vc11/lib/ -lopencv_calib3d249

INCLUDEPATH += $$PWD/../../../../../../../opencv/build/include
DEPENDPATH += $$PWD/../../../../../../../opencv/build/include/opencv2

RESOURCES += \
    imagenes.qrc
