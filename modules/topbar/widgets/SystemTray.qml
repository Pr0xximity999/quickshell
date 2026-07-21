pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Services.SystemTray

import QtQuick
import QtQuick.Layouts

import qs.components
import qs.config

RowLayout {
    id: root
    required property PanelWindow windowRoot

    layoutDirection: Qt.RightToLeft
    spacing: 0

    anchors.horizontalCenter: parent.horizontalCenter
    Repeater {
        model: SystemTray.items

        StyledRectangle {
            id: trayItem
            required property SystemTrayItem modelData

            implicitHeight: Appearance.containerSize.extra_small
            implicitWidth: Appearance.containerSize.extra_small

            Image {
                source: trayItem.modelData.icon
                fillMode: Image.PreserveAspectCrop
                anchors.fill: parent
            }

            MouseArea {
                id: clickarea
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: function (mouse) {
                    var pos = mapToGlobal(mouse.x, mouse.y);
                    if (mouse.button == Qt.RightButton) {
                        trayItem.modelData.display(root.windowRoot, pos.x, pos.y);
                    } else {
                        trayItem.modelData.secondaryActivate();
                    }
                }
            }
        }
    }
}
