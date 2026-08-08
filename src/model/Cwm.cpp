#include "Cwm.h"

#include <algorithm>
#include <cmath>

ConsoleWorkflowModel::ConsoleWorkflowModel(QObject *parent)
    : QObject(parent) {}

int ConsoleWorkflowModel::currentState() const {
    return m_currentState;
}

QString ConsoleWorkflowModel::selectedSurgeon() const {
    return m_selectedSurgeon;
}

int ConsoleWorkflowModel::pinProgress() const {
    return m_pinProgress;
}

double ConsoleWorkflowModel::ergoProgress() const {
    return m_ergoProgress;
}

int ConsoleWorkflowModel::monopolarCut() const {
    return m_monopolarCut;
}

int ConsoleWorkflowModel::bipolarCoag() const {
    return m_bipolarCoag;
}

void ConsoleWorkflowModel::setCurrentState(int val) {
    if (val < 0 || val > static_cast<int>(State::SystemMenu)) {
        return;
    }
    if (m_currentState == val) {
        return;
    }

    m_currentState = val;
    emit currentStateChanged();
}

void ConsoleWorkflowModel::setSelectedSurgeon(const QString &val) {
    if (val.isEmpty() || m_selectedSurgeon == val) {
        return;
    }

    m_selectedSurgeon = val;
    emit selectedSurgeonChanged();
}

void ConsoleWorkflowModel::setPinProgress(int val) {
    if (val < 0 || val > 6 || m_pinProgress == val) {
        return;
    }

    m_pinProgress = val;
    emit pinProgressChanged();
}

void ConsoleWorkflowModel::setErgoProgress(double val) {
    if (std::isnan(val)) {
        return;
    }

    const double clamped = std::clamp(val, 0.0, 1.0);
    if (std::abs(m_ergoProgress - clamped) < 1e-6) {
        return;
    }

    m_ergoProgress = clamped;
    emit ergoProgressChanged();
}

void ConsoleWorkflowModel::setMonopolarCut(int val) {
    if (val < 0 || val > 10 || m_monopolarCut == val) {
        return;
    }

    m_monopolarCut = val;
    emit monopolarCutChanged();
}

void ConsoleWorkflowModel::setBipolarCoag(int val) {
    if (val < 0 || val > 10 || m_bipolarCoag == val) {
        return;
    }

    m_bipolarCoag = val;
    emit bipolarCoagChanged();
}
