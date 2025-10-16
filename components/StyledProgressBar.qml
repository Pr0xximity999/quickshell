import QtQuick

import qs.config

Item {
    id: root
    required property int max
    required property int current
    
    
    Rectangle {
        id: maxProgress
        height: root.height
        width: root.width
        radius: 5
        color: Appearance.color.black
        Rectangle {
            id: currentProgress
            height: root.height
            width: Math.min(root.width / root.max * root.current, maxProgress.width)
            radius: 5
            color: Appearance.color.light
        }
    }
}