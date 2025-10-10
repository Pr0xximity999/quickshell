import QtQuick
import Quickshell

import qs.topbar.config
import qs.topbar.widgets

Item{
    id: root
    property alias clock : clock
    property alias text : clock.text

    ClockWidget {
        id: clock
        
        width: this.text.width
        height: root.height

        text.font.pointSize: Config.data.clockTextSize
        text.color: Config.data.clockTextColor
        text.onColorChanged: Config.data.clockTextColor = text.color
    }
}
