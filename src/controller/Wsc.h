#ifndef WORKFLOWSIMULATIONCONTROLLER_H
#define WORKFLOWSIMULATIONCONTROLLER_H

#include <QObject>
#include <QTimer>
#include <QMetaObject>
#include <chrono>

class ConsoleWorkflowModel;

class WorkflowSimulationController : public QObject {
    Q_OBJECT
public:
    explicit WorkflowSimulationController(QObject *parent = nullptr);
    
    void setModel(ConsoleWorkflowModel *model);
    void startSimulation();

private slots:
    void onSimulationTick();

private:
    QTimer m_timer;
    ConsoleWorkflowModel *m_model{nullptr};
    std::chrono::milliseconds m_simTime{0};
    QMetaObject::Connection m_modelConnection;
};

#endif
