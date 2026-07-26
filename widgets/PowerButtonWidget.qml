import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.components
import qs.config

StyledButton {
    id: root

    color: Appearance.color.black
    textColor: Appearance.color.white

    font {
        bold: true
        pointSize: 18
    }

    text: "󰐥"

    onClicked: {
        if (powerWindow.margins.right == -powerWindow.width) {
            powerWindow.margins.right = -powerWindow.width / 2;
            powerWindowOverlay.color = "#80000000";
        } else {
            powerWindow.margins.right = -powerWindow.width;
            powerWindowOverlay.color = Appearance.color.transparent;
        }
    }

    PanelWindow {
        id: powerWindowOverlay

        implicitHeight: screen.height
        implicitWidth: screen.width
        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        color: Appearance.color.transparent
        mask: Region {
            width: 0
            height: 0
        }

        visible: true

        exclusionMode: ExclusionMode.Ignore

        Behavior on color {
            ColorAnimation {
                duration: 500
            }
        }
    }

    PanelWindow {
        id: powerWindow
        color: Appearance.color.transparent

        exclusionMode: ExclusionMode.Ignore
        implicitWidth: 400
        implicitHeight: width

        anchors.right: true
        margins.right: -width

        mask: Region {
            shape: RegionShape.Ellipse
            item: powerWindowBg
        }

        StyledButton {
            id: powerWindowBg
            anchors.fill: parent
            radius: powerWindow.width
            color: Appearance.color.red
            border {
                width: 5
                color: Appearance.color.black
            }

            text: ""
            textColor: Appearance.color.white
            font.pointSize: 160

            onClicked: {
                powerWindowBg.color = "black";
                Quickshell.execDetached("poweroff");
            }

            HoverHandler {
                id: hover
                onHoveredChanged: {
                    if (hover.hovered) {
                        powerWindow.margins.right = 0;
                    } else {
                        powerWindow.margins.right = -powerWindow.width / 2;
                    }
                }
            }

            Behavior on color {
                ColorAnimation {
                    duration: 1000
                }
            }
        }

        Behavior on margins.right {
            NumberAnimation {
                easing.type: Easing.InOutQuad
            }
        }
    }
}
