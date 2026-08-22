#include "Wsc.h"
#include "model/Cwm.h"

#include <algorithm>
#include <cmath>

namespace controller {

namespace {
    using namespace ::std::chrono_literals;

    constexpr auto g_tickInterval{16ms};
    constexpr auto g_accountSelectTimeout{3000ms};
    constexpr auto g_pinStepInterval{400ms};
    constexpr auto g_pinEntryTimeout{3400ms};
    constexpr auto g_ergoTimeout{5500ms};
    constexpr auto g_procedureSelectTimeout{2500ms};
    constexpr auto g_overviewTimeout{5000ms};

    constexpr auto g_energyCutDelay{1000ms};
    constexpr auto g_energyCoagDelay{2000ms};
    constexpr auto g_energyConfigTimeout{3500ms};

    constexpr double g_ergoRampDurationMs{4000.0};
    constexpr int g_maxPinCount{6};
}

WorkflowSimulationController::WorkflowSimulationController(QObject *l_parent)
    : QObject(l_parent)
    , m_timer() {
    ::QObject::connect(&m_timer, &QTimer::timeout, this, &WorkflowSimulationController::onSimulationTick);
}

void WorkflowSimulationController::setModel(::model::ConsoleWorkflowModel *l_model) {
    if (m_modelConnection) {
        ::QObject::disconnect(m_modelConnection);
    }

    m_model = l_model;

    if (m_model) {
        m_modelConnection = ::QObject::connect(m_model, &::model::ConsoleWorkflowModel::currentStateChanged, this, [this]() {
            m_simTime = ::std::chrono::milliseconds::zero();
        });
    }
}

void WorkflowSimulationController::startSimulation() {
    m_timer.start(g_tickInterval);
}

void WorkflowSimulationController::onSimulationTick() {
    if (!m_model) {
        return;
    }

    m_simTime += ::std::chrono::milliseconds(m_timer.interval());

    const auto l_state = m_model->currentState();
    using State = ::model::ConsoleWorkflowModel::State;

    if (l_state == State::AccountSelect) {
        if (m_simTime > g_accountSelectTimeout) {
            m_model->setSelectedSurgeon("SUPERVISOR");
            m_model->setPinProgress(0);
            m_model->setErgoProgress(0.0);
            m_model->setCurrentState(State::PinEntry);
            m_simTime = 0ms;
        }
    } 
    else if (l_state == State::PinEntry) {
        int l_targetPins = static_cast<int>(
            ::std::lround(m_simTime.count() / static_cast<double>(g_pinStepInterval.count()))
        ); 
        
        if (l_targetPins <= g_maxPinCount) {
            m_model->setPinProgress(l_targetPins);
        }

        if (m_model->pinProgress() >= g_maxPinCount && m_simTime > g_pinEntryTimeout) {
            m_model->setCurrentState(State::Ergonomics);
            m_simTime = 0ms;
        }
    }
    else if (l_state == State::Ergonomics) {
        double l_targetProgress = ::std::min(1.0, m_simTime.count() / g_ergoRampDurationMs);
        m_model->setErgoProgress(l_targetProgress);

        if (m_simTime > g_ergoTimeout) {
            m_model->setCurrentState(State::ProcedureSelect);
            m_simTime = 0ms;
        }
    }
    else if (l_state == State::ProcedureSelect) {
        if (m_simTime > g_procedureSelectTimeout) {
            m_model->setCurrentState(State::EnergyConfig);
            m_simTime = 0ms;
        }
    }
    else if (l_state == State::EnergyConfig) {
        if (m_simTime > g_energyCutDelay && m_model->monopolarCut() != 5) {
            m_model->setMonopolarCut(5);
        }
        
        if (m_simTime > g_energyCoagDelay && m_model->bipolarCoag() != 4) {
            m_model->setBipolarCoag(4);
        }

        if (m_simTime > g_energyConfigTimeout) {
            m_model->setCurrentState(State::Overview);
            m_simTime = 0ms;
        }
    }
    else if (l_state == State::Overview) {
        if (m_simTime > g_overviewTimeout) {
            m_model->setPinProgress(0);
            m_model->setErgoProgress(0.0);
            m_model->setMonopolarCut(6);
            m_model->setBipolarCoag(3);
            m_model->setSelectedSurgeon("GUEST");
            m_model->setCurrentState(State::AccountSelect);
            m_simTime = 0ms;
        }
    }
}

} // namespace controller
