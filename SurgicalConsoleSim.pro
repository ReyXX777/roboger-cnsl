QT += quick quickcontrols2
CONFIG += c++1z console
CONFIG -= app_bundle
INCLUDEPATH += src

RESOURCES += resources.qrc


HEADERS += \
    src/model/ConsoleWorkflowModel.h \
    src/controller/WorkflowSimulationController.h

SOURCES += \
    src/main.cpp \
    src/model/ConsoleWorkflowModel.cpp \
    src/controller/WorkflowSimulationController.cpp


qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target