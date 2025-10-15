import QtQuick

import qs.config
import qs.components
import qs.topbar.widgets

StyledRectangle{
    id: root
    property alias clock : clock
    property alias text : clock.text

    implicitWidth: clock.width
    implicitHeight: clock.height

    ClockWidget {
        id: clock
        width: text.width + Appearance.padding.medium
        height: text.height + Appearance.padding.small
        text.font.pointSize: Appearance.textSize.normal
        text.wrapMode: Text.Wrap
    }
}
