QT += quick quickcontrols2
CONFIG += c++1z console
CONFIG -= app_bundle
INCLUDEPATH += src

RESOURCES += resources.qrc


HEADERS += \
    src/model/Cwm.h \
    src/controller/Wsc.h

SOURCES += \
    src/main.cpp \
    src/model/Cwm.cpp \
    src/controller/Wsc.cpp


qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target