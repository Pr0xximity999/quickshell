import QtQuick
import Quickshell

import qs.singletons

Item{
    id: root
    property alias text: text

    Text {
        id: text
        text: Clock.time
    }
}
