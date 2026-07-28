import QtQuick
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Hyprland
import QtQml

import qs.config
import qs.components


RowLayout {
    id: root
    spacing: Appearance.padding.extra_small

    StyledButton {
        implicitWidth: Appearance.containerSize.medium
        implicitHeight: Appearance.containerSize.small
        color: Appearance.color.magenta

        text: "🌕"

        onClicked: sleepProc.running = true
        Process {
            id: sleepProc
            command: ["systemctl", "suspend"]
        }
    }

    StyledButton {
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

    StyledButton {
        id: sunsetButton
        property bool isSunset: true
        implicitWidth: Appearance.containerSize.medium
        implicitHeight: Appearance.containerSize.small
        color: isSunset ? Appearance.color.yellow : Appearance.color.black

        text: !isSunset ? "☀️" : ""

        onClicked: {
            if(sunsetButton.isSunset)
            {
                sunsetStopProc.running = true
            }
            else{
                sunsetStartProc.running = true
            }
        }

        Process {
            id: sunsetCheckProc
            command: [ "pgrep", "-x", "hyprsunset" ]
            stdout: StdioCollector {
                onStreamFinished: sunsetButton.isSunset = this.text != ""
            }
            running: false
        }

        Process{
            id: sunsetStartProc
            command: ["hyprsunset"]
            running: false
        }

        Process{
            id: sunsetStopProc
            command: ["pkill", "hyprsunset"]
            running: false
        }

        Timer{
            interval: 500
            running: true
            repeat: true
            onTriggered: sunsetCheckProc.running = true
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
