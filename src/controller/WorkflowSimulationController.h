#ifndef WORKFLOWSIMULATIONCONTROLLER_H
#define WORKFLOWSIMULATIONCONTROLLER_H

#include <QObject>
#include <QTimer>
#include "model/ConsoleWorkflowModel.h"

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
    ConsoleWorkflowModel *m_model = nullptr;
    double m_simTime = 0.0;
};

#endif 