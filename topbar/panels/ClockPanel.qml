import QtQuick

import qs.config
import qs.topbar.widgets

Item{
    id: root
    property alias clock : clock
    property alias text : clock.text

    ClockWidget {
        id: clock
        
        width: this.text.width
        height: root.height

        text.font.pointSize: Appearance.clock.size
        text.color: Appearance.clock.color
        onTextChanged: Appearance.clock.color = text.color
    }
}
