#include "Cwm.h"

ConsoleWorkflowModel::ConsoleWorkflowModel(QObject *parent)
    : QObject(parent)
    , m_currentState(State::AccountSelect)
    , m_selectedSurgeon("GUEST")
    , m_pinProgress(0)
    , m_ergoProgress(0.0)
    , m_monopolarCut(6)
    , m_bipolarCoag(3) {}
