import QtQuick
import Quickshell

import qs.data
import qs.components

Item{
    id: root
    property alias text: text

    StyledText {
        id: text
        text: Clock.time
    }
}
