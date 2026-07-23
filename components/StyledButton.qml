import QtQuick
import QtQuick.Controls

import qs.config

Button {
    id: root
    property alias textColor: text.color
    property alias color: background.color
    property alias radius: background.radius
    property alias topRightRadius: background.topRightRadius
    property alias topLeftRadius: background.topLeftRadius
    property alias bottomRightRadius: background.bottomRightRadius
    property alias bottomLeftRadius: background.bottomLeftRadius
    property alias border: background.border

    readonly property string otherColor: highlighted ?  Appearance.color.selected : Appearance.color.unselected
    color: hovered && !highlighted ? Appearance.color.grey : otherColor
    background: StyledRectangle{
        id: background
        color: root.otherColor
        anchors.fill: parent
    }
    
    // Needed since otherwise the text is displayed underneath the rectangle for some reason
    contentItem: Text{
        id: text
        text: root.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font: root.font
    }
}
