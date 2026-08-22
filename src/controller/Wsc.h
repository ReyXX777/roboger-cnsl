#ifndef WORKFLOWSIMULATIONCONTROLLER_H
#define WORKFLOWSIMULATIONCONTROLLER_H

#include <QObject>
#include <QTimer>
#include <QMetaObject>
#include <chrono>

namespace model {
class ConsoleWorkflowModel;
}

namespace controller {

class WorkflowSimulationController : public QObject {
    Q_OBJECT
public:
    explicit WorkflowSimulationController(QObject *l_parent = nullptr);
    
    void setModel(::model::ConsoleWorkflowModel *l_model);
    void startSimulation();

private slots:
    void onSimulationTick();

private:
    QTimer m_timer{};
    ::model::ConsoleWorkflowModel *m_model{nullptr};
    ::std::chrono::milliseconds m_simTime{0};
    QMetaObject::Connection m_modelConnection{};
};

} // namespace controller

#endif // WORKFLOWSIMULATIONCONTROLLER_H
