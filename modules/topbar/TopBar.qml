import QtQuick
import Quickshell
import QtCore

import qs.modules.topbar.panels
import qs.config


Variants {
    model: Quickshell.screens

    Scope {
        id: root
        required property ShellScreen modelData
        
        PanelWindow {
            id: window
            implicitWidth: 800
            implicitHeight: 400
            color: "transparent"

            // Makes the window overlay the screen
            exclusionMode: ExclusionMode.Ignore

            anchors{
                top: true
            }

            mask: Region{
                item: background
            }


            Rectangle {
                id: background
                width: 300
                height: 40
                color: "transparent"
                bottomLeftRadius: 5
                bottomRightRadius: 5
                anchors.horizontalCenter: parent.horizontalCenter
                border{
                    color: mouseArea.hovered ?  Appearance.color.front : "transparent"
                    width: 2
                }

                HoverHandler {
                    id: mouseArea
                }

                Panels{
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
                            background.width: 480
                            background.height: 400
                            background.color: Appearance.color.back
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
    }
}
