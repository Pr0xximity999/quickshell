import QtQuick

import qs.topbar.panels
import qs.topbar.widgets

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
            implicitWidth: this.clock.width
            height: 100
        }

        MediaPanel{
            id: media       
            width: 0
            height: 100
            
            opacity: 0
        }
    }
}