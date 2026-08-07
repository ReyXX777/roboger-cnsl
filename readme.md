# Surgical Console Simulator (Qt/QML/C++)

HF automated simulation of a robotic surgical console HMI

![Qt 5.15](https://img.shields.io/badge/Qt-5.15.2-green) ![C++17](https://img.shields.io/badge/C++-17-blue) ![QML](https://img.shields.io/badge/UI-QML-orange)



## 🖥️ 6 Screen Automated Workflow

The simulator runs a continuous, hands-free demo loop:

| State | Screen | Simulation Action |
|-------|--------|-------------------|
| **0** | **Account Select** | 
| **1** | **PIN Entry** | 
| **2** | **Ergonomics** | 
| **3** | **Procedure Select** | 
| **4** | **Energy Config** | 
| **5** | **Overview** | 
##  Build & Run 


```powershell
make clean
qmake ..\SurgicalConsoleSim.pro 
make -j4
.\release\SurgicalConsoleSim.exe