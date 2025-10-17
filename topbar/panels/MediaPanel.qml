pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import qs.topbar.widgets
import qs.components
import qs.services


StyledRectangle {
    id: root
    ColumnLayout{
        id: itemColumn
        width: parent.width
        height: parent.height
        MediaPlayer{
            id: mediaPlayer
            width: itemColumn.width
            Layout.fillHeight: true
        }

        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            CollapsableMenu{
                anchors.top: parent.top
                height: 25
                width: parent.width
                buttons: MediaPlayers.playerNames
                onSelected: (number) => MediaPlayers.setActivePlayer(number)
            }
        }
    }
}
