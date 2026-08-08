#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <cstdlib>

#include "model/Cwm.h"
#include "controller/Wsc.h"

int main(int argc, char *argv[]) {
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    ConsoleWorkflowModel workflowModel;

    WorkflowSimulationController simController;
    simController.setModel(&workflowModel);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("consoleModel", &workflowModel);

    const QUrl url(QStringLiteral("qrc:/qml/Main.qml"));
    engine.load(url);

    if (engine.rootObjects().isEmpty()) {
        return EXIT_FAILURE;
    }

    simController.startSimulation();

    return app.exec();
}
