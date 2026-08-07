import QtQuick 2.15

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

    
    Text {
        text: "ROBOGER"
        color: "#E6F2F8"
        font.family: root.uiFont
        font.pixelSize: Math.min(28, Math.max(16, root.height * 0.055))
        font.letterSpacing: 6
        font.capitalization: Font.AllUppercase
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: root.height * 0.08
    }

    
    Row {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: root.height * 0.05 // Slight offset below true center for visual balance
        spacing: root.width * 0.035

        
        Rectangle {
            width: root.width * 0.38
            height: root.height * 0.32
            radius: 4
            border.color: "#3A6B8C"
            border.width: 1
            clip: true
            
            
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#1E4263" }
                GradientStop { position: 1.0; color: "#122A42" }
            }

            Column {
                anchors.centerIn: parent
                spacing: root.height * 0.025

                Text {
                    text: "☁ ROBOGER ACCOUNTS"
                    color: "#7AB8D6"
                    font.family: root.uiFont
                    font.pixelSize: Math.min(15, Math.max(11, root.height * 0.032))
                    font.weight: Font.DemiBold
                    font.letterSpacing: 0.8
                }
                
                Text {
                    text: "Syncs case metrics, procedural\ndata and settings."
                    color: "#8AB4D6"
                    font.family: root.uiFont
                    font.pixelSize: Math.min(13, Math.max(10, root.height * 0.026))
                    wrapMode: Text.WordWrap
                    width: parent.width * 0.85
                    horizontalAlignment: Text.AlignHCenter
                    lineHeight: 1.1
                    lineHeightMode: Text.ProportionalHeight
                }
            }
            
            MouseArea {
                anchors.fill: parent
                onClicked: consoleModel.currentState = 1
                cursorShape: Qt.PointingHandCursor
            }
        }

        
        Rectangle {
            width: root.width * 0.38
            height: root.height * 0.32
            radius: 4
            color: "#0F2032"
            border.color: "#243D52"
            border.width: 1
            clip: true

            Column {
                anchors.centerIn: parent
                spacing: root.height * 0.025
                
                Text {
                    text: "CONSOLE-ONLY ACCOUNTS"
                    color: "#7AA0B5"
                    font.family: root.uiFont
                    font.pixelSize: Math.min(15, Math.max(11, root.height * 0.032))
                    font.letterSpacing: 0.8
                }
                
                Text {
                    text: "Settings save to this system only"
                    color: "#5A7A90"
                    font.family: root.uiFont
                    font.pixelSize: Math.min(13, Math.max(10, root.height * 0.026))
                    wrapMode: Text.WordWrap
                    width: parent.width * 0.85
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            
            MouseArea {
                anchors.fill: parent
                onClicked: consoleModel.currentState = 1 // Optional: allow clicking this too
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}