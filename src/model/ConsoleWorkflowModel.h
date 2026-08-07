#ifndef CONSOLEWORKFLOWMODEL_H
#define CONSOLEWORKFLOWMODEL_H

#include <QObject>
#include <cmath>
#include <QtMath>

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

    int currentState() const { return m_currentState; }
    QString selectedSurgeon() const { return m_selectedSurgeon; }
    int pinProgress() const { return m_pinProgress; }
    double ergoProgress() const { return m_ergoProgress; }
    int monopolarCut() const { return m_monopolarCut; }
    int bipolarCoag() const { return m_bipolarCoag; }

    void setCurrentState(int val) {
        if (val < 0 || val > 6) return; 
        if (m_currentState == val) return; 
        
        m_currentState = val;
        emit currentStateChanged(); 
    }

    void setSelectedSurgeon(const QString &val) {
        if (val.isEmpty()) return; 
        if (m_selectedSurgeon == val) return; 
        
        m_selectedSurgeon = val;
        emit selectedSurgeonChanged(); 
    }

    
    void setPinProgress(int val) {
        if (val < 0 || val > 6) return;       
        if (m_pinProgress == val) return;     
        
        m_pinProgress = val;
        emit pinProgressChanged();            
    }

    
    void setErgoProgress(double val) {
        if (std::isnan(val)) return;
        val = qBound(0.0, val, 1.0);
        // Use fuzzy compare that handles 0.0 correctly
        if (qFuzzyCompare(m_ergoProgress + 1.0, val + 1.0)) return;
        m_ergoProgress = val;
        emit ergoProgressChanged();
    }

    
    void setMonopolarCut(int val) {
        if (val < 0 || val > 10) return;      
        if (m_monopolarCut == val) return;    
        
        m_monopolarCut = val;
        emit monopolarCutChanged();           
    }

    
    void setBipolarCoag(int val) {
        if (val < 0 || val > 10) return;      
        if (m_bipolarCoag == val) return;     
        
        m_bipolarCoag = val;
        emit bipolarCoagChanged();            
    }

signals:
    void currentStateChanged();
    void selectedSurgeonChanged();
    void pinProgressChanged();
    void ergoProgressChanged();
    void monopolarCutChanged();
    void bipolarCoagChanged();

private:
    int m_currentState = State::AccountSelect;
    QString m_selectedSurgeon = "GUEST";
    int m_pinProgress = 0;
    double m_ergoProgress = 0.0;
    int m_monopolarCut = 6; 
    int m_bipolarCoag = 3;  
};

#endif 