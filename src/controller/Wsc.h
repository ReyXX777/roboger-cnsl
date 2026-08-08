#ifndef WORKFLOWSIMULATIONCONTROLLER_H
#define WORKFLOWSIMULATIONCONTROLLER_H

#include <QObject>
#include <QTimer>

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
    ConsoleWorkflowModel *m_model;
    double m_simTime;
};

#endif
