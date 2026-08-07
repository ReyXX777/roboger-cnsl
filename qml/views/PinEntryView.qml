import QtQuick 2.15; import "../components"
Item {
    id: root; anchors.fill: parent
    readonly property string uiFont: "Segoe UI"
    Column {
        anchors.centerIn: parent; spacing: root.height*0.04
        Text { text: "ENTER PIN"; color: "#FFF"; font.family: uiFont; font.pixelSize: root.height*0.055; anchors.horizontalCenter: parent.horizontalCenter }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter; spacing: root.width*0.012
            Repeater { model: 6
                delegate: Rectangle { width: Math.max(12, root.width*0.016); height: width; radius: width/2; color: index < consoleModel.pinProgress ? "#00E5FF" : "transparent"; border.color: "#00E5FF"; border.width: 2 }
            }
        }
        Grid { columns: 3; spacing: root.width*0.01; anchors.horizontalCenter: parent.horizontalCenter
            Repeater { model: ["1","2","3","4","5","6","7","8","9","<","0","X"]
                delegate: MedicalButton { text: modelData; implicitWidth: root.width*0.065; implicitHeight: root.height*0.10; glowColor: "#335577" }
            }
        }
    }
}