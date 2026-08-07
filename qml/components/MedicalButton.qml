import QtQuick 2.15; import QtQuick.Controls 2.15
Button {
    id: control
    property color glowColor: "#00E5FF"
    property bool isActive: false
    implicitWidth: Math.max(80, contentItem.implicitWidth + 32)
    implicitHeight: 44
    background: Rectangle {
        radius: 4
        color: control.down ? "#1A3B5C" : (control.isActive ? "#224466" : "#0A192F")
        border.color: control.hovered||control.isActive ? control.glowColor : "#335577"
        border.width: control.hovered||control.isActive ? 2 : 1
    }
    contentItem: Text {
        text: control.text; font.family: "Segoe UI"
        font.pixelSize: control.height * 0.34
        font.letterSpacing: 0.6
        color: control.hovered||control.isActive?"#FFF":"#88AABB"
        horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
    }
}