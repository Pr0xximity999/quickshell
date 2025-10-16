import QtQuick
import Quickshell
import QtCore

import qs.topbar.panels
import qs.config


Variants {
    model: Quickshell.screens

    Scope {
        id: root
        required property ShellScreen modelData
        
        PanelWindow {
            id: window
            implicitWidth: background.width
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
                width: 480
                height: 30
                color: Appearance.color.back
                bottomLeftRadius: 20
                bottomRightRadius: 20
                border{
                    color: Appearance.color.front
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
                            background.height: 400
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
                            NumberAnimation {
                                properties: "height, y, margins"
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
