#ifndef CONSOLEWORKFLOWMODEL_H
#define CONSOLEWORKFLOWMODEL_H

#include <QObject>
#include <QString>

class ConsoleWorkflowModel : public QObject {
    Q_OBJECT
    Q_PROPERTY(int currentState READ currentState WRITE setCurrentState NOTIFY currentStateChanged)
    Q_PROPERTY(QString selectedSurgeon READ selectedSurgeon WRITE setSelectedSurgeon NOTIFY selectedSurgeonChanged)
    Q_PROPERTY(int pinProgress READ pinProgress WRITE setPinProgress NOTIFY pinProgressChanged)
    Q_PROPERTY(double ergoProgress READ ergoProgress WRITE setErgoProgress NOTIFY ergoProgressChanged)
    Q_PROPERTY(int monopolarCut READ monopolarCut WRITE setMonopolarCut NOTIFY monopolarCutChanged)
    Q_PROPERTY(int bipolarCoag READ bipolarCoag WRITE setBipolarCoag NOTIFY bipolarCoagChanged)

public:
    enum State { AccountSelect = 0, PinEntry, Ergonomics, ProcedureSelect, EnergyConfig, Overview, SystemMenu };
    Q_ENUM(State)

    explicit ConsoleWorkflowModel(QObject *parent = nullptr);

    int currentState() const;
    QString selectedSurgeon() const;
    int pinProgress() const;
    double ergoProgress() const;
    int monopolarCut() const;
    int bipolarCoag() const;

    void setCurrentState(int val);
    void setSelectedSurgeon(const QString &val);
    void setPinProgress(int val);
    void setErgoProgress(double val);
    void setMonopolarCut(int val);
    void setBipolarCoag(int val);

signals:
    void currentStateChanged();
    void selectedSurgeonChanged();
    void pinProgressChanged();
    void ergoProgressChanged();
    void monopolarCutChanged();
    void bipolarCoagChanged();

private:
    int m_currentState{AccountSelect};
    QString m_selectedSurgeon{"GUEST"};
    int m_pinProgress{0};
    double m_ergoProgress{0.0};
    int m_monopolarCut{6};
    int m_bipolarCoag{3};
};

#endif
