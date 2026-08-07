import QtQuick 2.15
Item {
    id: root; anchors.fill: parent
    readonly property string uiFont: "Segoe UI"
    property int selectedCategory: 0
    Item {
        id: contentArea; anchors.fill: parent; anchors.margins: root.width*0.02
        Text { id: titleLabel; text: "SELECT PROCEDURES"; color: "#7A8FA0"; font.family: uiFont; font.pixelSize: root.height*0.04; anchors.top: parent.top; anchors.left: parent.left }
        Row {
            anchors.top: titleLabel.bottom; anchors.topMargin: root.height*0.025; anchors.bottom: parent.bottom; anchors.left: parent.left; anchors.right: parent.right; spacing: root.width*0.015
            Item { width: parent.width*0.26; height: parent.height
                ListView { anchors.fill: parent; spacing: root.height*0.01; model: ["MY CASES","CARDIAC","GENERAL\nSURGERY","GYNECOLOGY","HEAD & NECK","OTHER","THORACIC"]
                    delegate: Rectangle { width: parent.width; height: contentArea.height*0.105; radius: 2; color: index===root.selectedCategory?"#2E4E6A":"#162738"; border.color: index===root.selectedCategory?"#3F6585":"transparent"; border.width: index===root.selectedCategory?1:0
                        Text { text: modelData; color: index===root.selectedCategory?"#EAF6FB":"#7CB4C5"; font.family: uiFont; font.pixelSize: contentArea.height*0.032; anchors.centerIn: parent; horizontalAlignment: Text.AlignHCenter; lineHeight: 0.9 }
                    }
                }
            }
            Rectangle { width: 1; height: parent.height; color: "#1E3A50" }
            Item { width: parent.width*0.72; height: parent.height
                ListView { anchors.fill: parent; spacing: root.height*0.01; model: ["SLEEVE GASTRECTOMY","AXILLARY LYMPHADENECTOMY","CHOLECYSTECTOMY","HIATAL HERNIA - PARAESOPHAGEAL","INGUINAL HERNIA - UNILATERAL","LYMPHADENECTOMY","RECTAL EXCISION"]
                    delegate: Rectangle { width: parent.width; height: contentArea.height*0.105; radius: 2; color: "#1B3248"; border.color: "#203D59"; border.width: 1
                        Row { anchors.fill: parent; anchors.margins: parent.width*0.02; spacing: 8
                            Text { width: parent.width*0.88; text: modelData; color: "#8EC8D8"; font.family: uiFont; font.pixelSize: contentArea.height*0.034; anchors.verticalCenter: parent.verticalCenter; elide: Text.ElideRight }
                            Rectangle { width: parent.height*0.45; height: width; radius: 2; color: "transparent"; border.color: "#6E94A6"; anchors.verticalCenter: parent.verticalCenter; Text { text: "✓"; color: "#D9F0F6"; anchors.centerIn: parent } }
                        }
                    }
                }
            }
        }
    }
}