import Quickshell
import QtQuick

import qs.topbar.panels
import qs.topbar.widgets

Item{
    id: root

    readonly property alias clock: clock
    readonly property alias media: media
    readonly property alias picker: colorPicker

    Grid{
        columns: 2
        spacing: 2
        horizontalItemAlignment: Grid.AlignHCenter
        verticalItemAlignment: Grid.AlignVCenter
        anchors.centerIn: parent

        ClockPanel{
            id: clock
            implicitWidth: this.clock.width
            height: 100
        }

        MediaPanel{
            id: media       
            width: 0
            height: 100
            
            opacity: 0
        }

        ColorPicker {
            id: colorPicker
            target: clock.text
            implicitWidth: this.picker.width
            height: 0
            
            opacity: 0
        }
    }
}