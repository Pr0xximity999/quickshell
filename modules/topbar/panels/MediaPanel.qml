pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import qs.widgets
import qs.components
import qs.services

StyledRectangle {
    id: root

    ColumnLayout {
        id: itemColumn
        width: parent.width
        height: parent.height

        opacity: MediaPlayers.playerNames.length > 0 ? 1 : 0
        MediaPlayer {
            id: mediaPlayer
            width: itemColumn.width
            Layout.fillHeight: true
        }

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            CollapsableMenu {
                anchors.top: parent.top
                height: 25
                width: parent.width
                buttons: MediaPlayers.playerNames
                onSelected: number => MediaPlayers.setActivePlayer(number)
            }
        }
    }

    StyledText {
        width: parent.width
        height: parent.height
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: "No media sources found"

        opacity: MediaPlayers.playerNames.length > 0 ? 0 : 1
    }
}
