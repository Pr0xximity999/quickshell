import QtQuick
import Quickshell.Wayland
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
            implicitHeight: Screen.height
            color: Appearance.color.transparent
            exclusionMode: ExclusionMode.Ignore

            anchors {
                top: true
            }

            // So i can see waybar
            margins {
                top: 0
            }

            mask: Region {
                item: background
                Region{
                    item: middleMenu
                }
            }

            Rectangle {
                id: background
                color: Appearance.color.back
                width: Screen.width
                height: 45
            }

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

                anchors {
                    top: window.top
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
