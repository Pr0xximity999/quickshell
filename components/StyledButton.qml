import QtQuick
import QtQuick.Controls
import Quickshell

import qs.config

Button {
    id: root
    property alias color: background.color
    readonly property string otherColor: highlighted ?  Appearance.color.selected : Appearance.color.unselected

    color: hovered && !highlighted ? Appearance.color.grey : otherColor
    
    background: Rectangle{
        id: background
        color: root.otherColor
    }
}