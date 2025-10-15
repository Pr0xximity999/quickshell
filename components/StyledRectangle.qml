import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.config

Rectangle{
    id: root
    default property alias data: container.contentItem

    color: Appearance.color.secondary
    radius: 20

    Control{
        id: container
        width: root.width
        height: root.height
        topPadding: Math.min(Appearance.padding.small, root.height / 8)
        leftPadding: Math.min(Appearance.padding.small, root.width / 8)
        Layout.alignment: Qt.AlignVCenter
    }
}