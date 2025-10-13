import QtQuick

import qs.config

Rectangle{
    id: root
    color: Appearance.color.secondary
    radius: 20

    Component.onCompleted: {
        for (var item in children){
            // children[item].anchors.centerIn = root;
        }
    }
}