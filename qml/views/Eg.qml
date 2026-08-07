import QtQuick 2.15
import "../components"

Item {
    id: root
    anchors.fill: parent
    readonly property string uiFont: "Segoe UI"

    
    Rectangle {
        anchors.fill: parent
        color: "#081828"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0F2942" }
            GradientStop { position: 1.0; color: "#070F1A" }
        }
    }

    Column {
        anchors.fill: parent
        anchors.leftMargin: root.width * 0.05
        anchors.rightMargin: root.width * 0.05
        anchors.topMargin: root.height * 0.06
        anchors.bottomMargin: root.height * 0.06
        spacing: root.height * 0.035

        
        Text {
            text: "ADJUST SUPERVISOR CONSOLE ERGONOMICS"
            color: "#FFFFFF"
            font.family: root.uiFont
            font.pixelSize: Math.max(14, root.height * 0.038)
            font.capitalization: Font.AllUppercase
            wrapMode: Text.WordWrap
            width: parent.width
        }

        
        Rectangle {
            width: parent.width * 0.55
            height: root.height * 0.22 // Proportional height
            radius: 4
            border.color: "#2A4E68"
            border.width: 1
            clip: true
            
            
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#16304A" }
                GradientStop { position: 1.0; color: "#0E2032" }
            }

            Column {
                anchors.centerIn: parent
                spacing: root.height * 0.015

                Text {
                    text: "APPLY SAVED ERGONOMICS"
                    color: "#E2EEF5"
                    font.family: root.uiFont
                    font.pixelSize: Math.max(12, root.height * 0.032)
                    font.weight: Font.DemiBold
                }
                
                Text {
                    text: "Please wait"
                    color: "#7A9AB5"
                    font.family: root.uiFont
                    font.pixelSize: Math.max(10, root.height * 0.026)
                }
            }
        }

        
        Item {
            width: parent.width * 0.55
            height: root.height * 0.05
            
            
            Rectangle {
                anchors.fill: parent
                radius: height / 2
                color: "#1A2A3A"
                border.color: "#2A4E68"
                border.width: 1
            }
            
            
            Rectangle {
                width: parent.width * consoleModel.ergoProgress
                height: parent.height
                radius: height / 2
                color: "#00E5FF"
                
                
                layer.enabled: true
                layer.effect: Item {
                    Rectangle {
                        anchors.fill: parent
                        radius: parent.height / 2
                        border.color: "#00E5FF"
                        border.width: 2
                        opacity: 0.4
                    }
                }
            }
            
            
            Text {
                text: Math.round(consoleModel.ergoProgress * 100) + "%"
                color: "#FFFFFF"
                font.family: root.uiFont
                font.pixelSize: Math.max(11, root.height * 0.028)
                font.weight: Font.DemiBold
                anchors.left: parent.right
                anchors.leftMargin: root.width * 0.02
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        
        MedicalButton {
            text: "GET UP ERGONOMICS"
            implicitWidth: parent.width * 0.55
            implicitHeight: root.height * 0.12 // Proportional height
            glowColor: "#335577"
            
            
            contentItem: Text {
                text: parent.text
                font.family: root.uiFont
                font.pixelSize: Math.max(12, root.height * 0.030)
                font.capitalization: Font.AllUppercase
                color: parent.hovered ? "#FFFFFF" : "#A8C2CE"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        
        
        Item { width: 1; height: 1 }
    }
}