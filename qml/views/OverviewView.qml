import QtQuick 2.15

Item {
    id: root
    anchors.fill: parent
    readonly property string uiFont: "Segoe UI"
    readonly property int selectedTab: 0

    Item {
        id: contentArea
        anchors.fill: parent
        anchors.leftMargin: root.width * 0.015
        anchors.rightMargin: root.width * 0.02
        anchors.topMargin: root.height * 0.015
        anchors.bottomMargin: root.height * 0.015

        
        Row {
            id: tabBar
            width: parent.width
            height: parent.height * 0.10
            spacing: root.width * 0.005

            Rectangle {
                width: (parent.width - tabBar.spacing) / 2
                height: parent.height
                radius: 3
                color: root.selectedTab === 0 ? "#3A5F82" : "#16293C"
                border.color: "#2A4A5E"
                border.width: 1
                clip: true
                
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: root.selectedTab === 0 ? 3 : 0
                    color: "#7AB8D6"
                    Behavior on height { NumberAnimation { duration: 200 } }
                }
                
                Row {
                    anchors.centerIn: parent
                    spacing: parent.width * 0.025
                    
                    Rectangle {
                        width: Math.max(18, parent.height * 0.45)
                        height: width
                        radius: width / 2
                        color: "transparent"
                        border.color: "#A9C7D6"
                        border.width: 1
                        anchors.verticalCenter: parent.verticalCenter
                        
                        Text { 
                            text: "👤"
                            anchors.centerIn: parent
                            color: "#A9C7D6"
                            font.pixelSize: Math.max(10, parent.height * 0.55) 
                        }
                    }
                    
                    Text {
                        text: "MY OVERVIEW"
                        color: root.selectedTab === 0 ? "#E6F2F8" : "#7AA0B5"
                        font.family: root.uiFont
                        font.pixelSize: Math.max(11, contentArea.height * 0.030)
                        font.letterSpacing: 0.8
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }

            Rectangle {
                width: (parent.width - tabBar.spacing) / 2
                height: parent.height
                radius: 3
                color: "#122336"
                border.color: "#1E3A50"
                border.width: 1
                
                Text {
                    text: "CASE OVERVIEW"
                    color: "#6E8FA2"
                    font.family: root.uiFont
                    font.pixelSize: Math.max(11, contentArea.height * 0.030)
                    font.letterSpacing: 0.8
                    anchors.centerIn: parent
                }
            }
        }

        Rectangle {
            id: tabLine
            anchors.top: tabBar.bottom
            anchors.topMargin: 1
            width: parent.width
            height: 1
            color: "#2A4A5E"
        }

        
        Column {
            id: sections
            anchors.top: tabLine.bottom
            anchors.topMargin: parent.height * 0.04
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            spacing: parent.height * 0.035 // Slightly reduced spacing for compactness

            
            Row {
                width: parent.width
                spacing: parent.width * 0.035
                property real labelW: width * 0.25
                
                Text {
                    width: parent.labelW
                    text: "ERGONOMICS"
                    color: "#7FA0B0"
                    font.family: root.uiFont
                    font.pixelSize: Math.max(11, contentArea.height * 0.030)
                    font.weight: Font.DemiBold
                    wrapMode: Text.WordWrap
                }
                Text {
                    width: parent.width - parent.labelW - parent.spacing
                    text: "SAVED SETTINGS APPLIED."
                    color: "#A8C2CE"
                    font.family: root.uiFont
                    font.pixelSize: Math.max(11, contentArea.height * 0.029)
                    wrapMode: Text.WordWrap
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            
            Row {
                width: parent.width
                spacing: parent.width * 0.035
                property real labelW: width * 0.25
                
                Text {
                    width: parent.labelW
                    text: "PROCEDURES"
                    color: "#7FA0B0"
                    font.family: root.uiFont
                    font.pixelSize: Math.max(11, contentArea.height * 0.030)
                    font.weight: Font.DemiBold
                    wrapMode: Text.WordWrap
                }
                Column {
                    width: parent.width - parent.labelW - parent.spacing
                    spacing: contentArea.height * 0.012
                    
                    Text { 
                        width: parent.width
                        text: "AORTIC RING DISSECTION"
                        color: "#A8C2CE"
                        font.family: root.uiFont
                        font.pixelSize: Math.max(11, contentArea.height * 0.029)
                        wrapMode: Text.WordWrap 
                    }
                    Text { 
                        width: parent.width
                        text: "AORTIC VALVE RESECTION"
                        color: "#A8C2CE"
                        font.family: root.uiFont
                        font.pixelSize: Math.max(11, contentArea.height * 0.029)
                        wrapMode: Text.WordWrap 
                    }
                }
            }

            
            Row {
                width: parent.width
                spacing: parent.width * 0.035
                property real labelW: width * 0.25
                
                Text {
                    width: parent.labelW
                    text: "ENERGY"
                    color: "#7FA0B0"
                    font.family: root.uiFont
                    font.pixelSize: Math.max(11, contentArea.height * 0.030)
                    font.weight: Font.DemiBold
                    wrapMode: Text.WordWrap
                    anchors.verticalCenter: parent.verticalCenter // Center align with the compact card
                }

                Rectangle {
                    id: energyBox
                    width: parent.width - parent.labelW - parent.spacing
                    
                    height: energyContent.implicitHeight + (contentArea.height * 0.04)
                    color: "#0E2336"
                    border.color: "#2A4E68"
                    border.width: 1
                    radius: 3
                    clip: true 

                    Column {
                        id: energyContent
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        
                        anchors.margins: contentArea.height * 0.025 
                        spacing: contentArea.height * 0.015 

                        Text {
                            text: "CURRENT GENERATOR SETTINGS"
                            color: "#7A90A0"
                            font.family: root.uiFont
                            
                            font.pixelSize: Math.min(14, Math.max(10, contentArea.height * 0.028))
                            width: parent.width
                            wrapMode: Text.WordWrap
                        }

                        Row {
                            width: parent.width
                            spacing: parent.width * 0.06 

                            
                            Column {
                                width: (parent.width - parent.spacing) / 2
                                spacing: contentArea.height * 0.012 

                                Text { 
                                    text: "MONOPOLAR"
                                    color: "#C2D6E0"
                                    font.family: root.uiFont
                                    font.pixelSize: Math.min(16, Math.max(11, contentArea.height * 0.032))
                                    font.weight: Font.DemiBold 
                                }
                                
                                Row {
                                    width: parent.width
                                    spacing: parent.width * 0.05 
                                    
                                    Text { 
                                        width: parent.width * 0.65 
                                        text: "CLEAN CUT\nMAX MAX"
                                        color: "#D8C73E"
                                        font.family: root.uiFont
                                        font.pixelSize: Math.min(13, Math.max(9, contentArea.height * 0.026))
                                        lineHeight: 0.95
                                        lineHeightMode: Text.ProportionalHeight 
                                        wrapMode: Text.WordWrap 
                                    }
                                    Text { 
                                        text: "4"
                                        color: "#D8C73E"
                                        font.family: root.uiFont
                                        
                                        font.pixelSize: Math.min(22, Math.max(16, contentArea.height * 0.045))
                                        font.weight: Font.DemiBold
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }
                                
                                Row {
                                    width: parent.width
                                    spacing: parent.width * 0.05 
                                    
                                    Text { 
                                        width: parent.width * 0.65 
                                        text: "MAXMAX\n13W MAX"
                                        color: "#4A8CC0"
                                        font.family: root.uiFont
                                        font.pixelSize: Math.min(13, Math.max(9, contentArea.height * 0.026))
                                        lineHeight: 0.95
                                        lineHeightMode: Text.ProportionalHeight 
                                        wrapMode: Text.WordWrap 
                                    }
                                    Text { 
                                        text: "4"
                                        color: "#4A8CC0"
                                        font.family: root.uiFont
                                        font.pixelSize: Math.min(22, Math.max(16, contentArea.height * 0.045))
                                        font.weight: Font.DemiBold
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                }
                            }

                            
                            Column {
                                width: (parent.width - parent.spacing) / 2
                                spacing: contentArea.height * 0.012 

                                Text { 
                                    text: "BIPOLAR"
                                    color: "#C2D6E0"
                                    font.family: root.uiFont
                                    font.pixelSize: Math.min(16, Math.max(11, contentArea.height * 0.032))
                                    font.weight: Font.DemiBold 
                                }
                                
                                Row {
                                    width: parent.width
                                    spacing: parent.width * 0.05 
                                    
                                    Text { 
                                        width: parent.width * 0.65 
                                        text: "SOFT COAG\n3W MAX\nAUTO STOP ON"
                                        color: "#5A8AB0"
                                        font.family: root.uiFont
                                        font.pixelSize: Math.min(13, Math.max(9, contentArea.height * 0.026))
                                        lineHeight: 0.95
                                        lineHeightMode: Text.ProportionalHeight 
                                        wrapMode: Text.WordWrap 
                                    }
                                    Text { 
                                        text: "4"
                                        color: "#4A8CC0"
                                        font.family: root.uiFont
                                        font.pixelSize: Math.min(22, Math.max(16, contentArea.height * 0.045))
                                        font.weight: Font.DemiBold
                                        anchors.verticalCenter: parent.verticalCenter 
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}