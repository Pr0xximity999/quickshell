import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.config

Rectangle{
    id: root
    default property alias data: container.children

    color: Appearance.color.secondary
    radius: 20

    Control{
        width: root.width
        height: root.height
        topPadding: Math.min(Appearance.padding.small, root.height / 8)
        bottomPadding: Math.min(Appearance.padding.small, root.height / 8)
        rightPadding: Math.min(Appearance.padding.small, root.width / 8)
        leftPadding: Math.min(Appearance.padding.small, root.width / 8)

        contentItem: Item{
            id: container

        }
    }
}