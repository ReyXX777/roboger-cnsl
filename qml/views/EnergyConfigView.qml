import QtQuick 2.15

Item {
    id: root
    anchors.fill: parent
    readonly property string uiFont: "Segoe UI"

    Item {
        id: contentArea
        anchors.fill: parent
        anchors.leftMargin: root.width * 0.02
        anchors.rightMargin: root.width * 0.025
        anchors.topMargin: root.height * 0.015
        anchors.bottomMargin: root.height * 0.015

        Text {
            id: titleLabel
            text: "APPLY ENERGY PRESETS"
            color: "#7A8FA0"
            font.family: root.uiFont
            font.pixelSize: Math.min(16, Math.max(11, contentArea.height * 0.035))
            font.letterSpacing: 0.8
            anchors.top: parent.top
            anchors.left: parent.left
        }

        Column {
            anchors.top: titleLabel.bottom
            anchors.topMargin: contentArea.height * 0.03
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            spacing: contentArea.height * 0.025

            
            Rectangle {
                id: cardA
                width: parent.width
                
                height: contentA.implicitHeight + (contentArea.height * 0.06)
                radius: 4
                border.color: "#3A6B8C"
                border.width: 1
                clip: true
                
                
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#1E4263" }
                    GradientStop { position: 1.0; color: "#122A42" }
                }

                Row {
                    id: rowA
                    anchors.fill: parent
                    anchors.margins: contentArea.height * 0.03
                    spacing: contentArea.width * 0.03

                    
                    Item {
                        width: parent.width - radioA.width - parent.spacing
                        height: parent.height
                        
                        Column {
                            id: contentA
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            spacing: contentArea.height * 0.02

                            Text {
                                text: "PRESET A V10"
                                color: "#8AB4D6"
                                font.family: root.uiFont
                                font.pixelSize: Math.min(13, Math.max(9, contentArea.height * 0.028))
                                font.letterSpacing: 0.6
                            }

                            Row {
                                width: parent.width
                                spacing: parent.width * 0.06

                                
                                Column {
                                    width: (parent.width - parent.spacing) * 0.48
                                    spacing: contentArea.height * 0.015

                                    Text { 
                                        text: "MONOPOLAR"
                                        color: "#E2EEF5"
                                        font.family: root.uiFont
                                        font.pixelSize: Math.min(15, Math.max(11, contentArea.height * 0.032))
                                        font.weight: Font.DemiBold
                                        font.letterSpacing: 0.5
                                    }

                                    Row {
                                        width: parent.width
                                        spacing: parent.width * 0.04
                                        
                                        Text { 
                                            width: parent.width * 0.65
                                            text: "DRY CUT\n50M MAX"
                                            color: "#D8C73E"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(12, Math.max(9, contentArea.height * 0.026))
                                            lineHeight: 0.95
                                            lineHeightMode: Text.ProportionalHeight
                                            wrapMode: Text.WordWrap
                                        }
                                        Text { 
                                            text: "6"
                                            color: "#D8C73E"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(24, Math.max(16, contentArea.height * 0.055))
                                            font.weight: Font.DemiBold
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                    }
                                    
                                    Row {
                                        width: parent.width
                                        spacing: parent.width * 0.04
                                        
                                        Text { 
                                            width: parent.width * 0.65
                                            text: "FORCES. LARE\nSTM MAX"
                                            color: "#4A8CC0"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(12, Math.max(9, contentArea.height * 0.026))
                                            lineHeight: 0.95
                                            lineHeightMode: Text.ProportionalHeight
                                            wrapMode: Text.WordWrap
                                        }
                                        Text { 
                                            text: "1"
                                            color: "#4A8CC0"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(24, Math.max(16, contentArea.height * 0.055))
                                            font.weight: Font.DemiBold
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                    }
                                }

                                
                                Column {
                                    width: (parent.width - parent.spacing) * 0.52
                                    spacing: contentArea.height * 0.015
                                    
                                    Text { 
                                        text: "BIPOLAR"
                                        color: "#E2EEF5"
                                        font.family: root.uiFont
                                        font.pixelSize: Math.min(15, Math.max(11, contentArea.height * 0.032))
                                        font.weight: Font.DemiBold
                                        font.letterSpacing: 0.5
                                    }

                                    Row {
                                        width: parent.width
                                        spacing: parent.width * 0.04
                                        
                                        Text { 
                                            width: parent.width * 0.70
                                            text: "SOFT COAR\n1W MAX\nAUTO-STOP ON"
                                            color: "#5A8AB0"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(12, Math.max(9, contentArea.height * 0.026))
                                            lineHeight: 0.95
                                            lineHeightMode: Text.ProportionalHeight
                                            wrapMode: Text.WordWrap
                                        }
                                        Text { 
                                            text: "3"
                                            color: "#4A8CC0"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(24, Math.max(16, contentArea.height * 0.055))
                                            font.weight: Font.DemiBold
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                    }
                                }
                            }
                        }
                    }

                    
                    Item {
                        id: radioA
                        width: contentArea.height * 0.08
                        height: parent.height
                        
                        Rectangle {
                            width: Math.min(parent.width, 22)
                            height: width
                            radius: width / 2
                            anchors.centerIn: parent
                            color: "transparent"
                            border.color: "#7AB8D6"
                            border.width: 2
                            
                            Rectangle {
                                width: parent.width * 0.5
                                height: parent.height * 0.5
                                radius: width / 2
                                anchors.centerIn: parent
                                color: "#7AB8D6"
                            }
                        }
                    }
                }
            }

            
            Rectangle {
                id: cardB
                width: parent.width
                height: contentB.implicitHeight + (contentArea.height * 0.06)
                radius: 4
                color: "#0F2032"
                border.color: "#243D52"
                border.width: 1
                clip: true

                Row {
                    id: rowB
                    anchors.fill: parent
                    anchors.margins: contentArea.height * 0.03
                    spacing: contentArea.width * 0.03

                    Item {
                        width: parent.width - radioB.width - parent.spacing
                        height: parent.height
                        
                        Column {
                            id: contentB
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            spacing: contentArea.height * 0.02

                            Text { 
                                text: "PRESET B V10"
                                color: "#6A8A9E"
                                font.family: root.uiFont
                                font.pixelSize: Math.min(13, Math.max(9, contentArea.height * 0.028))
                                font.letterSpacing: 0.6
                            }
                            
                            Row {
                                width: parent.width
                                spacing: parent.width * 0.06
                                
                                Column {
                                    width: (parent.width - parent.spacing) * 0.48
                                    spacing: contentArea.height * 0.015
                                    
                                    Text { 
                                        text: "MONOPOLAR"
                                        color: "#C2D6E0"
                                        font.family: root.uiFont
                                        font.pixelSize: Math.min(15, Math.max(11, contentArea.height * 0.032))
                                        font.weight: Font.DemiBold
                                        font.letterSpacing: 0.5
                                    }
                                    
                                    Row { 
                                        width: parent.width
                                        spacing: parent.width * 0.04
                                        
                                        Text { 
                                            width: parent.width * 0.65
                                            text: "DRY CUT\n14TW MAX"
                                            color: "#D8C73E"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(12, Math.max(9, contentArea.height * 0.026))
                                            lineHeight: 0.95
                                            lineHeightMode: Text.ProportionalHeight
                                            wrapMode: Text.WordWrap
                                        }
                                        Text { 
                                            text: "5"
                                            color: "#D8C73E"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(24, Math.max(16, contentArea.height * 0.055))
                                            font.weight: Font.DemiBold
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                    }
                                    
                                    Row { 
                                        width: parent.width
                                        spacing: parent.width * 0.04
                                        
                                        Text { 
                                            width: parent.width * 0.65
                                            text: "FORCED COAR\nSTM MAX"
                                            color: "#4A8CC0"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(12, Math.max(9, contentArea.height * 0.026))
                                            lineHeight: 0.95
                                            lineHeightMode: Text.ProportionalHeight
                                            wrapMode: Text.WordWrap
                                        }
                                        Text { 
                                            text: "3"
                                            color: "#4A8CC0"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(24, Math.max(16, contentArea.height * 0.055))
                                            font.weight: Font.DemiBold
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                    }
                                }
                                
                                Column {
                                    width: (parent.width - parent.spacing) * 0.52
                                    spacing: contentArea.height * 0.015
                                    
                                    Text { 
                                        text: "BIPOLAR"
                                        color: "#C2D6E0"
                                        font.family: root.uiFont
                                        font.pixelSize: Math.min(15, Math.max(11, contentArea.height * 0.032))
                                        font.weight: Font.DemiBold
                                        font.letterSpacing: 0.5
                                    }
                                    
                                    Row { 
                                        width: parent.width
                                        spacing: parent.width * 0.04
                                        
                                        Text { 
                                            width: parent.width * 0.70
                                            text: "SOFT STAR\n17W MAX\nAUTO STOP ON"
                                            color: "#5A8AB0"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(12, Math.max(9, contentArea.height * 0.026))
                                            lineHeight: 0.95
                                            lineHeightMode: Text.ProportionalHeight
                                            wrapMode: Text.WordWrap
                                        }
                                        Text { 
                                            text: "7"
                                            color: "#4A8CC0"
                                            font.family: root.uiFont
                                            font.pixelSize: Math.min(24, Math.max(16, contentArea.height * 0.055))
                                            font.weight: Font.DemiBold
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    Item {
                        id: radioB
                        width: contentArea.height * 0.08
                        height: parent.height
                        
                        Rectangle {
                            width: Math.min(parent.width, 22)
                            height: width
                            radius: width / 2
                            anchors.centerIn: parent
                            color: "transparent"
                            border.color: "#4A6680"
                            border.width: 1.5
                        }
                    }
                }
            }
        }

        
        Rectangle {
            anchors.right: parent.right
            anchors.top: titleLabel.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: -root.width * 0.015
            width: 2
            color: "#1E3A50"
            opacity: 0.8
        }
    }
}