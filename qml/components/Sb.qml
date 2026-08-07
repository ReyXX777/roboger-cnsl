import QtQuick 2.15

Rectangle {
    id: root
    color: "transparent"
    readonly property string uiFont: "Segoe UI"
    property var steps: ["SUPERVISOR","ERGONOMICS","PROCEDURES","ENERGY","OVERVIEW"]

    
    property int currentStep: {
        if(consoleModel.currentState <= 1) return 0
        if(consoleModel.currentState === 2) return 1
        if(consoleModel.currentState === 3) return 2
        if(consoleModel.currentState === 4) return 3
        return 4
    }

    Column {
        anchors.fill: parent
        spacing: 2

        Repeater {
            model: root.steps
            delegate: Rectangle {
                id: itemBox
                width: root.width
                height: root.height * 0.112
                radius: 2
                property bool isActive: index === root.currentStep
                property bool isCompleted: index < root.currentStep
                property bool isFuture: index > root.currentStep

                color: isActive ? "#3D5E7E" : "#1C3148"
                Behavior on color { ColorAnimation { duration: 200 } }

                Row {
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width * 0.10
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: parent.width * 0.06

                    Item {
                        id: iconBox
                        width: itemBox.height * 0.46
                        height: width
                        anchors.verticalCenter: parent.verticalCenter

                        
                        Rectangle {
                            id: checkBg
                            anchors.fill: parent
                            radius: width/2
                            color: "#8BC8D6"
                            visible: isCompleted
                            scale: isCompleted ? 1 : 0
                            Behavior on scale { NumberAnimation { duration: 280; easing.type: Easing.OutBack } }
                        }
                        Text {
                            text: "✓"
                            visible: isCompleted
                            color: "#102030"
                            font.family: root.uiFont
                            font.pixelSize: parent.height * 0.70
                            font.bold: true
                            anchors.centerIn: parent
                            anchors.verticalCenterOffset: -1
                            opacity: isCompleted ? 1 : 0
                            Behavior on opacity { NumberAnimation { duration: 200 } }
                        }

                        
                        Rectangle {
                            anchors.fill: parent
                            radius: width/2
                            color: "transparent"
                            border.color: "#4A6680"
                            border.width: 1
                            visible: isFuture
                            opacity: 0.7
                        }

                        
                    }

                    Text {
                        text: modelData
                        color: isActive ? "#C8DCE8" : (isCompleted ? "#8FB4C6" : "#5A7A90")
                        font.family: root.uiFont
                        font.pixelSize: Math.max(11, itemBox.height * 0.32)
                        font.letterSpacing: 0.8
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                MouseArea { anchors.fill: parent; onClicked: consoleModel.currentState = index===0?0:1+index }
            }
        }
    }
}