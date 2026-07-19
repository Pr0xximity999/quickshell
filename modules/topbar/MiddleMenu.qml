import QtQuick
import Quickshell

import qs.modules.topbar.panels
import qs.config

PopupWindow {
    id: root

    implicitWidth: Screen.width
    implicitHeight: middleBackground.height + 100
    color: Appearance.color.transparent
    visible: true
    mask: Region {
        item: middleBackground
    }

    Rectangle {
        id: middleBackground
        width: 300
        height: 40
        color: "transparent"
        bottomLeftRadius: 5
        bottomRightRadius: 5
        
        anchors.horizontalCenter: parent.horizontalCenter

        border {
            color: mouseArea.hovered ? Appearance.color.front : "transparent"
            width: 2
        }

        HoverHandler {
            id: mouseArea
        }

        Panels {
            id: panels
            width: parent.width
            height: parent.height
        }

        states: [
            State {
                id: state1
                name: "focussed"
                when: mouseArea.hovered
                PropertyChanges {
                    middleBackground.width: 480
                    middleBackground.height: 400
                    middleBackground.color: Appearance.color.back
                    panels.media.opacity: 1
                    panels.testing_zone.opacity: 1
                    panels.media.width: 150
                    panels.anchors.margins: Appearance.padding.small
                }
            }
        ]

        transitions: [
            Transition {
                to: "focussed"
                reversible: true
                SequentialAnimation {
                    ColorAnimation {
                        properties: "color"
                        duration: 2 //Instant, lower than 2 makes it not work
                    }
                    NumberAnimation {
                        properties: "height, y, margins, radius"
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                    NumberAnimation {
                        properties: "width"
                        duration: 100
                        easing.type: Easing.Bezier
                    }
                    NumberAnimation {
                        properties: "opacity"
                        duration: 200
                        easing.type: Easing.Bezier
                    }
                }
            }
        ]
    }
}
