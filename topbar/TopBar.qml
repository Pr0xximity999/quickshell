import QtQuick
import Quickshell

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
                intersection: Intersection.Intersect
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
                        name: "focussed"
                        when: mouseArea.hovered
                        PropertyChanges {
                            background.height: 400
                            panels.y: -background.height / 3
                            panels.media.opacity: 1
                            panels.media.width: 100
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: ""
                        to: "focussed"
                        reversible: true
                        SequentialAnimation {
                            NumberAnimation {
                                properties: "height, implicitHeight, y"
                                duration: 100
                                easing.type: Easing.InOutQuad
                            }
                            NumberAnimation {
                                properties: "opacity, width"
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
