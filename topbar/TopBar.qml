import QtQuick
import Quickshell

import qs.topbar.panels
import qs.config


Variants {
    model: Quickshell.screens

    Scope {
        id: scopeqs
        required property ShellScreen modelData
        
        PanelWindow {
            id: window
            implicitWidth: background.width
            implicitHeight: background.height + 3 //prevents smearing
            color: "transparent"

            // Makes the window overlay the screen
            exclusionMode: ExclusionMode.Ignore

            anchors {
                top: true
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

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                }

                Panels{
                    id: panels
                    width: parent.width
                    height: parent.height
                    y: parent.height * 1.3
                }
                

                states: [
                    State {
                        name: "focussed"
                        when: mouseArea.containsMouse
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
                                properties: "height, y"
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
