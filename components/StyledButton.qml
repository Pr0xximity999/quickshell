import QtQuick
import QtQuick.Controls
import Quickshell

import qs.config

Button {
    id: root
    property alias color: background.color
    background: Rectangle{
        id: background
        color: root.highlighted ?  Appearance.color.selected : Appearance.color.unselected
    }
}