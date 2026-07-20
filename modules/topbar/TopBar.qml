import QtQuick
import Quickshell

import qs.config

Variants {
    model: Quickshell.screens

    Scope {
        id: root
        required property ShellScreen modelData

        PanelWindow {
            id: window
            implicitWidth: Screen.width
            implicitHeight: 45
            color: "transparent"

            anchors {
                top: true
            }
            Region {
                item: background
            }
            mask: Region {
                item: background
            }

            Rectangle {
                id: background
                color: Appearance.color.back
                width: Screen.width
                height: 45

                LeftMenu { 
                    id: leftMenu

                    anchors {
                        left: parent.left
                        top: parent.top

                        leftMargin: Appearance.padding.extra_small
                        topMargin: Appearance.padding.extra_small
                    }
                }

                MiddleMenu {
                    id: middleMenu

                    anchor {
                        window: window
                    }
                }

                RightMenu {
                    id: rightmenu
                    windowRoot: window
                    anchors {
                        right: parent.right
                        top: parent.top
                        rightMargin: Appearance.padding.extra_small
                        topMargin: Appearance.padding.extra_small
                    }
                }
            }
        }
    }
}
