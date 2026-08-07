import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: parent.width
    height: parent.height * 0.09
    border.color: "#1A3B5C"
    border.width: 1
    
    
    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: "#06101A" }
        GradientStop { position: 0.5; color: "#0A1828" }
        GradientStop { position: 1.0; color: "#06101A" }
    }

    
    Rectangle {
        anchors.top: parent.top
        width: parent.width
        height: 1
        color: "#2A4A5E"
        opacity: 0.6
    }

    
    Row {
        id: leftIcons
        anchors.left: parent.left
        anchors.leftMargin: root.width * 0.025
        anchors.verticalCenter: parent.verticalCenter
        spacing: root.width * 0.018

        
        Item {
            width: root.height * 0.55
            height: root.height
            
            Canvas {
                anchors.centerIn: parent
                width: parent.width * 0.8
                height: parent.width * 0.8
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();
                    ctx.strokeStyle = "#7AA0B5";
                    ctx.lineWidth = Math.max(1, width * 0.06);
                    ctx.lineCap = "round";
                    
                    ctx.beginPath();
                    ctx.arc(width/2, height*0.32, width*0.22, 0, Math.PI*2);
                    ctx.stroke();
                    
                    ctx.beginPath();
                    ctx.moveTo(width*0.15, height*0.95);
                    ctx.quadraticCurveTo(width/2, height*0.55, width*0.85, height*0.95);
                    ctx.stroke();
                }
            }
        }

        
        Rectangle { 
            width: 1
            height: root.height * 0.45
            color: "#2A4A5E"
            anchors.verticalCenter: parent.verticalCenter
            opacity: 0.7
        }

        
        Item {
            width: root.height * 0.65
            height: root.height
            
            Canvas {
                anchors.centerIn: parent
                width: parent.width * 0.85
                height: parent.width * 0.85
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();
                    ctx.strokeStyle = "#7AA0B5";
                    ctx.lineWidth = Math.max(1, width * 0.05);
                    ctx.lineCap = "round";
                    ctx.lineJoin = "round";
                    
                    ctx.beginPath();
                    ctx.moveTo(width*0.25, height*0.85);
                    ctx.lineTo(width*0.55, height*0.55);
                    ctx.arc(width*0.65, height*0.45, width*0.12, Math.PI*0.75, Math.PI*2.25);
                    ctx.stroke();
                    
                    ctx.beginPath();
                    ctx.moveTo(width*0.85, height*0.85);
                    ctx.lineTo(width*0.60, height*0.60);
                    ctx.lineTo(width*0.55, height*0.65);
                    ctx.lineTo(width*0.80, height*0.90);
                    ctx.closePath();
                    ctx.stroke();
                    
                    ctx.beginPath();
                    ctx.moveTo(width*0.60, height*0.60);
                    ctx.lineTo(width*0.65, height*0.55);
                    ctx.stroke();
                }
            }
        }

        
        Item {
            width: root.height * 0.55
            height: root.height
            
            Canvas {
                anchors.centerIn: parent
                width: parent.width * 0.8
                height: parent.width * 0.8
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();
                    ctx.strokeStyle = "#7AA0B5";
                    ctx.fillStyle = "#7AA0B5";
                    ctx.lineWidth = Math.max(1, width * 0.05);
                    ctx.lineCap = "round";
                    
                    var lineY1 = height * 0.28;
                    var lineY2 = height * 0.50;
                    var lineY3 = height * 0.72;
                    var knobR = width * 0.09;
                    
                    ctx.beginPath();
                    ctx.moveTo(width*0.1, lineY1); ctx.lineTo(width*0.9, lineY1);
                    ctx.moveTo(width*0.1, lineY2); ctx.lineTo(width*0.9, lineY2);
                    ctx.moveTo(width*0.1, lineY3); ctx.lineTo(width*0.9, lineY3);
                    ctx.stroke();
                    
                    ctx.beginPath(); ctx.arc(width*0.70, lineY1, knobR, 0, Math.PI*2); ctx.fill();
                    ctx.beginPath(); ctx.arc(width*0.30, lineY2, knobR, 0, Math.PI*2); ctx.fill();
                    ctx.beginPath(); ctx.arc(width*0.60, lineY3, knobR, 0, Math.PI*2); ctx.fill();
                }
            }
        }
    }

    
    Row {
        id: rightStatus
        anchors.right: parent.right
        anchors.rightMargin: root.width * 0.025
        anchors.verticalCenter: parent.verticalCenter
        spacing: root.width * 0.015

        Text {
            text: "IS"
            color: "#5A7A90"
            font.family: "Segoe UI"
            font.pixelSize: Math.max(10, root.height * 0.32)
            font.letterSpacing: 1.2
            anchors.verticalCenter: parent.verticalCenter
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter
            spacing: root.height * 0.015
            
            Text {
                text: consoleModel.selectedSurgeon.toUpperCase()
                color: "#E6F2F8"
                font.family: "Segoe UI"
                font.pixelSize: Math.max(11, root.height * 0.34)
                font.capitalization: Font.AllUppercase
                font.letterSpacing: 0.8
            }
            
            Text {
                text: "CONSOLE 1"
                color: "#7AA0B5"
                font.family: "Segoe UI"
                font.pixelSize: Math.max(9, root.height * 0.28)
                font.capitalization: Font.AllUppercase
                font.letterSpacing: 0.6
                anchors.right: parent.right
            }
        }

        
        Item {
            width: root.height * 0.50
            height: root.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: root.width * 0.005
            
            Canvas {
                anchors.centerIn: parent
                width: parent.width * 0.75
                height: parent.width * 0.75
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();
                    ctx.strokeStyle = "#7AA0B5";
                    ctx.lineWidth = Math.max(1, width * 0.06);
                    ctx.lineJoin = "round";
                    
                    ctx.beginPath();
                    ctx.moveTo(width*0.15, height*0.15);
                    ctx.lineTo(width*0.70, height*0.15);
                    ctx.lineTo(width*0.85, height*0.30);
                    ctx.lineTo(width*0.85, height*0.85);
                    ctx.lineTo(width*0.15, height*0.85);
                    ctx.closePath();
                    ctx.stroke();
                    
                    ctx.strokeRect(width*0.30, height*0.15, width*0.30, height*0.18);
                    ctx.strokeRect(width*0.25, height*0.50, width*0.50, height*0.35);
                }
            }
        }
    }
}