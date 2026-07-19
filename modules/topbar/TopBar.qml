import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Hyprland

import qs.config
import qs.components

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

            // Makes the window overlay the screen
            //exclusionMode: ExclusionMode.Ignore

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

                RowLayout {
                    spacing: Appearance.padding.extra_small

                    anchors {
                        left: parent.left
                        top: parent.top

                        leftMargin: Appearance.padding.extra_small
                        topMargin: Appearance.padding.extra_small
                    }

                    StyledButton {
                        id: container1
                        implicitWidth: Appearance.containerSize.medium
                        implicitHeight: Appearance.containerSize.small
                        color: Appearance.color.purple

                        text: "🌕"

                        onClicked: sleepProc.running = true
                        Process {
                            id: sleepProc
                            command: ["systemctl", "suspend"]
                        }
                    }

                    StyledButton {
                        id: container2
                        implicitWidth: Appearance.containerSize.medium
                        implicitHeight: Appearance.containerSize.small
                        color: Appearance.color.red
                        palette.buttonText: Appearance.color.black
                        text: ""

                        onClicked: lockProc.running = true
                        Process {
                            id: lockProc
                            command: ["hyprlock"]
                        }
                    }

                    Repeater {
                        model: 10

                        StyledButton {
                            required property int modelData
                            property HyprlandWorkspace ws: Hyprland.workspaces.values.find(w => w.id == modelData + 1) ?? null

                            implicitWidth: Appearance.containerSize.medium
                            implicitHeight: Appearance.containerSize.small
                            highlighted: ws?.active ?? false
                            visible: (ws?.active ?? false) || modelData < 3

                            palette.buttonText: Appearance.color.black
                            font.bold: true

                            text: modelData + 1
                            onClicked: Hyprland.dispatch(`hl.dsp.focus({workspace = ${modelData + 1}})`)
                        }
                    }
                }
            }

            MiddleMenu {
                id: middleMenu

                anchor {
                    window: window
                }
            }
        }
    }
}
