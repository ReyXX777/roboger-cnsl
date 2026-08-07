import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"

ApplicationWindow {
    id: window
    visible: true
    width: 1280; height: 800
    title: "Surgical Console Simulator"
    readonly property string uiFont: "Segoe UI"

    Rectangle {
        anchors.fill: parent
        color: "#05101A"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0A192F" }
            GradientStop { position: 1.0; color: "#020813" }
        }
    }

    Item {
        id: topBar
        anchors.top: parent.top; anchors.left: parent.left; anchors.right: parent.right
        height: parent.height * 0.12
        MedicalButton {
            text: "BACK"
            visible: consoleModel.currentState > 0
            anchors.left: parent.left; anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: parent.width * 0.02
            implicitWidth: parent.width * 0.10; implicitHeight: parent.height * 0.6
            onClicked: consoleModel.currentState--
        }
        Text {
            text: consoleModel.selectedSurgeon
            color: "#FFF"; font.family: window.uiFont
            font.pixelSize: parent.height * 0.32
            anchors.centerIn: parent
        }
        MedicalButton {
            text: "NEXT"
            visible: consoleModel.currentState < 5
            anchors.right: parent.right; anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: parent.width * 0.02
            implicitWidth: parent.width * 0.10; implicitHeight: parent.height * 0.6
            onClicked: consoleModel.currentState++
        }
        Rectangle { anchors.bottom: parent.bottom; width: parent.width; height: 1; color: "#1A3B5C" }
    }

    Item {
        id: bodyArea
        anchors.top: topBar.bottom; anchors.bottom: footerBar.top
        anchors.left: parent.left; anchors.right: parent.right

        Item {
            id: sideBarContainer
            anchors.left: parent.left; anchors.top: parent.top; anchors.bottom: parent.bottom
            width: parent.width * 0.20
            visible: consoleModel.currentState >= 2
            SideBar { anchors.fill: parent; anchors.margins: parent.width * 0.06 }
            Rectangle { anchors.right: parent.right; anchors.top: parent.top; anchors.bottom: parent.bottom; width: 1; color: "#1A3B5C" }
        }

        Loader {
            id: screenLoader
            anchors.top: parent.top; anchors.bottom: parent.bottom; anchors.right: parent.right
            anchors.left: sideBarContainer.visible ? sideBarContainer.right : parent.left
            source: {
                switch(consoleModel.currentState){
                    case 0: return "qrc:/qml/views/AccountSelectView.qml"
                    case 1: return "qrc:/qml/views/PinEntryView.qml"
                    case 2: return "qrc:/qml/views/ErgonomicsView.qml"
                    case 3: return "qrc:/qml/views/ProcedureView.qml"
                    case 4: return "qrc:/qml/views/EnergyConfigView.qml"
                    case 5: return "qrc:/qml/views/OverviewView.qml"
                    default: return "qrc:/qml/views/AccountSelectView.qml"
                }
            }
        }
    }
    FooterBar { id: footerBar; anchors.bottom: parent.bottom; anchors.left: parent.left; anchors.right: parent.right }
}