#include "Cwm.h"

#include <algorithm>
#include <cmath>

namespace model {

namespace {
    constexpr int g_maxPinProgress{6};
    constexpr int g_maxEnergySetting{10};
    constexpr double g_minErgoProgress{0.0};
    constexpr double g_maxErgoProgress{1.0};
    constexpr double g_ergoEpsilon{1.0e-6};
}

ConsoleWorkflowModel::ConsoleWorkflowModel(QObject *l_parent)
    : QObject(l_parent)
{
}

ConsoleWorkflowModel::State ConsoleWorkflowModel::currentState() const
{
    return m_currentState;
}

QString ConsoleWorkflowModel::selectedSurgeon() const
{
    return m_selectedSurgeon;
}

int ConsoleWorkflowModel::pinProgress() const
{
    return m_pinProgress;
}

double ConsoleWorkflowModel::ergoProgress() const
{
    return m_ergoProgress;
}

int ConsoleWorkflowModel::monopolarCut() const
{
    return m_monopolarCut;
}

int ConsoleWorkflowModel::bipolarCoag() const
{
    return m_bipolarCoag;
}

void ConsoleWorkflowModel::setCurrentState(State l_val)
{
    if (l_val < State::AccountSelect || l_val > State::SystemMenu) {
        return;
    }
    if (m_currentState == l_val) {
        return;
    }

    m_currentState = l_val;
    emit currentStateChanged();
}

void ConsoleWorkflowModel::setSelectedSurgeon(const QString &l_val)
{
    if (l_val.isEmpty() || m_selectedSurgeon == l_val) {
        return;
    }

    m_selectedSurgeon = l_val;
    emit selectedSurgeonChanged();
}

void ConsoleWorkflowModel::setPinProgress(int l_val)
{
    if (l_val < 0 || l_val > g_maxPinProgress || m_pinProgress == l_val) {
        return;
    }

    m_pinProgress = l_val;
    emit pinProgressChanged();
}

void ConsoleWorkflowModel::setErgoProgress(double l_val)
{
    if (::std::isnan(l_val)) {
        return;
    }

    const double l_clamped = ::std::clamp(l_val, g_minErgoProgress, g_maxErgoProgress);
    if (::std::abs(m_ergoProgress - l_clamped) < g_ergoEpsilon) {
        return;
    }

    m_ergoProgress = l_clamped;
    emit ergoProgressChanged();
}

void ConsoleWorkflowModel::setMonopolarCut(int l_val)
{
    if (l_val < 0 || l_val > g_maxEnergySetting || m_monopolarCut == l_val) {
        return;
    }

    m_monopolarCut = l_val;
    emit monopolarCutChanged();
}

void ConsoleWorkflowModel::setBipolarCoag(int l_val)
{
    if (l_val < 0 || l_val > g_maxEnergySetting || m_bipolarCoag == l_val) {
        return;
    }

    m_bipolarCoag = l_val;
    emit bipolarCoagChanged();
}

} // namespace model
