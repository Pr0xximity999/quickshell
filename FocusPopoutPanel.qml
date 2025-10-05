import QtQuick
import Quickshell
import Quickshell.Services.Mpris

PanelWindow {
    id: panel
    implicitWidth: page.width
    implicitHeight: page.height + 3 //prevents smearing
    color: "transparent"

    // Makes the window overlay the screen
    exclusionMode: ExclusionMode.Ignore

    anchors {
        top: true
    }

    Rectangle {
        id: page
        width: 480
        height: 30
        bottomLeftRadius: 20
        bottomRightRadius: 20

        color: "grey"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onWheel: (wheel) => {
                Config.data.clockTextSize += wheel.angleDelta.y / 100
            }
        }
        
        Rectangle {
            id: playerBox
            width: 70
            height: 40
            color: "gray"
            property MprisPlayer player
            opacity: 0 //tmporary

            Text{
                id: playerText
                text: playerBox.player.trackTitle     
            }
        }

        ClockWidget {
            id: clock
            // center the bar in its parent component (the window)
            anchors.centerIn: parent
            font.pointSize: Config.data.clockTextSize
            color: Config.data.clockTextColor
            onColorChanged: Config.data.clockTextColor = color
        }

        ColorPicker {
            id: colorPicker
            target: clock
            opacity: 0
            padding: 4
        }

        states: [
            State {
                name: "focussed"
                when: mouseArea.containsMouse
                PropertyChanges {
                    page.height: 150
                    colorPicker.opacity: 1
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
                        properties: "height"
                        duration: 500
                        easing.type: Easing.InOutQuad
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
