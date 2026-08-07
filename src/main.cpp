#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "model/Cwm.h"
#include "controller/Wsc.h"

int main(int argc, char *argv[]) {
    
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    
    ConsoleWorkflowModel workflowModel;

    
    WorkflowSimulationController simController;
    simController.setModel(&workflowModel);

    
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("consoleModel", &workflowModel);

    
    
    
    engine.load(QUrl(QStringLiteral("qrc:/qml/Main.qml")));
    
    if (engine.rootObjects().isEmpty())
        return -1;

    
    simController.startSimulation();

    return app.exec();
}