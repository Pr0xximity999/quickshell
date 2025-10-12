import QtQuick
import Quickshell

import qs.data

Item{
    id: root
    property alias text: text

    Text {
        id: text
        text: Clock.time
    }
}
