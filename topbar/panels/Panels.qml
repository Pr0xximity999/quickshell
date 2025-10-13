import QtQuick

import qs.topbar.panels

Item{
    id: root

    readonly property alias clock: clock
    readonly property alias media: media

    Grid{
        columns: 2
        spacing: 10
        horizontalItemAlignment: Grid.AlignHCenter
        verticalItemAlignment: Grid.AlignVCenter
        anchors.centerIn: parent
        
        ClockPanel{
            id: clock
            implicitWidth: this.clock.width + 50
            implicitHeight:  Math.min(100, root.height)
        }

        MediaPanel{
            id: media       
            width: 0
            height: Math.min(100, root.height)
            opacity: 0
        }
    }
}