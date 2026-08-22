#ifndef CONSOLEWORKFLOWMODEL_H
#define CONSOLEWORKFLOWMODEL_H

#include <QObject>
#include <QString>

namespace model {

class ConsoleWorkflowModel : public QObject {
    Q_OBJECT
    Q_PROPERTY(State currentState READ currentState WRITE setCurrentState NOTIFY currentStateChanged)
    Q_PROPERTY(QString selectedSurgeon READ selectedSurgeon WRITE setSelectedSurgeon NOTIFY selectedSurgeonChanged)
    Q_PROPERTY(int pinProgress READ pinProgress WRITE setPinProgress NOTIFY pinProgressChanged)
    Q_PROPERTY(double ergoProgress READ ergoProgress WRITE setErgoProgress NOTIFY ergoProgressChanged)
    Q_PROPERTY(int monopolarCut READ monopolarCut WRITE setMonopolarCut NOTIFY monopolarCutChanged)
    Q_PROPERTY(int bipolarCoag READ bipolarCoag WRITE setBipolarCoag NOTIFY bipolarCoagChanged)

public:
    enum class State : int {
        AccountSelect = 0,
        PinEntry,
        Ergonomics,
        ProcedureSelect,
        EnergyConfig,
        Overview,
        SystemMenu
    };
    Q_ENUM(State)

    explicit ConsoleWorkflowModel(QObject *l_parent = nullptr);

    State currentState() const;
    QString selectedSurgeon() const;
    int pinProgress() const;
    double ergoProgress() const;
    int monopolarCut() const;
    int bipolarCoag() const;

    void setCurrentState(State l_val);
    void setSelectedSurgeon(const QString &l_val);
    void setPinProgress(int l_val);
    void setErgoProgress(double l_val);
    void setMonopolarCut(int l_val);
    void setBipolarCoag(int l_val);

signals:
    void currentStateChanged();
    void selectedSurgeonChanged();
    void pinProgressChanged();
    void ergoProgressChanged();
    void monopolarCutChanged();
    void bipolarCoagChanged();

private:
    State m_currentState{State::AccountSelect};
    QString m_selectedSurgeon{"GUEST"};
    int m_pinProgress{0};
    double m_ergoProgress{0.0};
    int m_monopolarCut{6};
    int m_bipolarCoag{3};
};

} // namespace model

#endif // CONSOLEWORKFLOWMODEL_H
