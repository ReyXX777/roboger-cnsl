#include "Wsc.h"

WorkflowSimulationController::WorkflowSimulationController(QObject *parent)
    : QObject(parent) {
    connect(&m_timer, &QTimer::timeout, this, &WorkflowSimulationController::onSimulationTick);
}

void WorkflowSimulationController::setModel(ConsoleWorkflowModel *model) {
    m_model = model;
    
    connect(m_model, &ConsoleWorkflowModel::currentStateChanged, this, [this](){
        m_simTime = 0.0;
    });
}

void WorkflowSimulationController::startSimulation() {
    m_timer.start(16); // ~60fps delta-time loop
}

void WorkflowSimulationController::onSimulationTick() {
    if (!m_model) return;

    double dt = m_timer.interval() / 1000.0;
    m_simTime += dt;

    
    if (m_model->currentState() == ConsoleWorkflowModel::AccountSelect) {
        
        if (m_simTime > 3.0) {
            m_model->setSelectedSurgeon("SUPERVISOR");
            m_model->setPinProgress(0); // Reset PIN dots
            m_model->setErgoProgress(0.0); // Reset ergonomics for fresh loop
            m_model->setCurrentState(ConsoleWorkflowModel::PinEntry);
            m_simTime = 0.0;
        }
    } 
    
    else if (m_model->currentState() == ConsoleWorkflowModel::PinEntry) {
        
        int targetPins = static_cast<int>(m_simTime / 0.4); 
        
        if (targetPins <= 6) {
            m_model->setPinProgress(targetPins);
        }

        
        if (m_model->pinProgress() >= 6 && m_simTime > 3.4) {
            m_model->setCurrentState(ConsoleWorkflowModel::Ergonomics);
            m_simTime = 0.0;
        }
    }
    
    else if (m_model->currentState() == ConsoleWorkflowModel::Ergonomics) {
        
        double targetProgress = qMin(1.0, m_simTime / 4.0);
        m_model->setErgoProgress(targetProgress);

        
        if (m_simTime > 5.5) {
            m_model->setCurrentState(ConsoleWorkflowModel::ProcedureSelect);
            m_simTime = 0.0;
        }
    }
    
    else if (m_model->currentState() == ConsoleWorkflowModel::ProcedureSelect) {
        
        if (m_simTime > 2.5) {
            m_model->setCurrentState(ConsoleWorkflowModel::EnergyConfig);
            m_simTime = 0.0;
        }
    }
    
    else if (m_model->currentState() == ConsoleWorkflowModel::EnergyConfig) {
        
        
        
        if (m_simTime > 1.0 && m_model->monopolarCut() != 5) {
            m_model->setMonopolarCut(5);
        }
        
        
        if (m_simTime > 2.0 && m_model->bipolarCoag() != 4) {
            m_model->setBipolarCoag(4);
        }

        
        if (m_simTime > 3.5) {
            m_model->setCurrentState(ConsoleWorkflowModel::Overview);
            m_simTime = 0.0;
        }
    }
    
    else if (m_model->currentState() == ConsoleWorkflowModel::Overview) {
        
        if (m_simTime > 5.0) {
            m_model->setPinProgress(0);
            m_model->setErgoProgress(0.0);
            m_model->setMonopolarCut(6);
            m_model->setBipolarCoag(3);
            m_model->setSelectedSurgeon("GUEST");
            m_model->setCurrentState(ConsoleWorkflowModel::AccountSelect);
            m_simTime = 0.0;
        }
    }
}