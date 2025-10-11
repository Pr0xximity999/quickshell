import QtQuick
import Quickshell

Item {
    id: root
    required property int max
    required property int current
    
    
    Rectangle {
        id: maxProgress
        height: root.height
        width: root.width
        radius: 5
        color: "grey"
        Rectangle {
            id: currentProgress
            height: root.height
            width: root.width / root.max * root.current
            radius: 5
            color: "black"
        }
    }
}