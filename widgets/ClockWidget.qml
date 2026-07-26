import QtQuick

import qs.data
import qs.components

Item{
    id: root
    property alias text: text

    implicitHeight: text.height
    implicitWidth: text.width

    StyledText {
        id: text
        text: Clock.time
    }
}
