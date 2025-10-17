import QtQuick
import QtQuick.Controls
import Quickshell

import qs.config

Button {
    id: root
    property alias color: background.color
    property alias radius: background.radius
    property alias topRightRadius: background.topRightRadius
    property alias topLeftRadius: background.topLeftRadius
    property alias bottomRightRadius: background.bottomRightRadius
    property alias bottomLeftRadius: background.bottomLeftRadius
    property alias border: background.border

    readonly property string otherColor: highlighted ?  Appearance.color.selected : Appearance.color.unselected

    color: hovered && !highlighted ? Appearance.color.grey : otherColor
    
    background: Rectangle{
        id: background
        color: root.otherColor
    }
}