#include "Wsc.h"

#include <algorithm>
#include <cmath>

namespace {
    using namespace std::chrono_literals;

    constexpr auto kTickInterval          = 16ms;
    constexpr auto kAccountSelectTimeout  = 3000ms;
    constexpr auto kPinStepInterval       = 400ms;
    constexpr auto kPinEntryTimeout       = 3400ms;
    constexpr auto kErgoTimeout           = 5500ms;
    constexpr auto kProcedureSelectTimeout= 2500ms;
    constexpr auto kOverviewTimeout       = 5000ms;
}

WorkflowSimulationController::WorkflowSimulationController(QObject *parent)
    : QObject(parent)
    , m_timer() {
    connect(&m_timer, &QTimer::timeout, this, &WorkflowSimulationController::onSimulationTick);
}

void WorkflowSimulationController::setModel(ConsoleWorkflowModel *model) {
    if (m_modelConnection) {
        QObject::disconnect(m_modelConnection);
    }

    m_model = model;

    if (m_model) {
        m_modelConnection = connect(m_model, &ConsoleWorkflowModel::currentStateChanged, this, [this]() {
            m_simTime = std::chrono::milliseconds::zero();
        });
    }
}

void WorkflowSimulationController::startSimulation() {
    m_timer.start(kTickInterval);
}

void WorkflowSimulationController::onSimulationTick() {
    if (!m_model) {
        return;
    }

    m_simTime += std::chrono::milliseconds(m_timer.interval());

    const auto state = m_model->currentState();

    if (state == ConsoleWorkflowModel::AccountSelect) {
        if (m_simTime > kAccountSelectTimeout) {
            m_model->setSelectedSurgeon("SUPERVISOR");
            m_model->setPinProgress(0);
            m_model->setErgoProgress(0.0);
            m_model->setCurrentState(ConsoleWorkflowModel::PinEntry);
            m_simTime = 0ms;
        }
    } 
    else if (state == ConsoleWorkflowModel::PinEntry) {
        int targetPins = static_cast<int>(
            std::lround(m_simTime.count() / static_cast<double>(kPinStepInterval.count()))
        ); 
        
        if (targetPins <= 6) {
            m_model->setPinProgress(targetPins);
        }

        if (m_model->pinProgress() >= 6 && m_simTime > kPinEntryTimeout) {
            m_model->setCurrentState(ConsoleWorkflowModel::Ergonomics);
            m_simTime = 0ms;
        }
    }
    else if (state == ConsoleWorkflowModel::Ergonomics) {
        double targetProgress = std::min(1.0, m_simTime.count() / 4000.0);
        m_model->setErgoProgress(targetProgress);

        if (m_simTime > kErgoTimeout) {
            m_model->setCurrentState(ConsoleWorkflowModel::ProcedureSelect);
            m_simTime = 0ms;
        }
    }
    else if (state == ConsoleWorkflowModel::ProcedureSelect) {
        if (m_simTime > kProcedureSelectTimeout) {
            m_model->setCurrentState(ConsoleWorkflowModel::EnergyConfig);
            m_simTime = 0ms;
        }
    }
    else if (state == ConsoleWorkflowModel::EnergyConfig) {
        if (m_simTime > 1000ms && m_model->monopolarCut() != 5) {
            m_model->setMonopolarCut(5);
        }
        
        if (m_simTime > 2000ms && m_model->bipolarCoag() != 4) {
            m_model->setBipolarCoag(4);
        }

        if (m_simTime > 3500ms) {
            m_model->setCurrentState(ConsoleWorkflowModel::Overview);
            m_simTime = 0ms;
        }
    }
    else if (state == ConsoleWorkflowModel::Overview) {
        if (m_simTime > kOverviewTimeout) {
            m_model->setPinProgress(0);
            m_model->setErgoProgress(0.0);
            m_model->setMonopolarCut(6);
            m_model->setBipolarCoag(3);
            m_model->setSelectedSurgeon("GUEST");
            m_model->setCurrentState(ConsoleWorkflowModel::AccountSelect);
            m_simTime = 0ms;
        }
    }
}
