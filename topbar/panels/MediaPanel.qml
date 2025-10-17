pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris

import qs.topbar.widgets
import qs.components


StyledRectangle {
    id: root
    property int pNum: 0
    property list<MprisPlayer> players : Mpris.players.values
    property list<string> playerNames : players.map((player) => {return player.identity})
    property MprisPlayer activePlayer: players[pNum]

    ColumnLayout{
        id: itemColumn
        width: parent.width
        height: parent.height
        MediaPlayer{
            id: mediaPlayer
            width: itemColumn.width
            Layout.fillHeight: true

            player: root.activePlayer
        }
        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            CollapsableMenu{
                anchors.top: parent.top
                height: 25
                width: parent.width
                buttons: root.playerNames
                onSelected: (number) => root.activePlayer = root.players[number]
            }
        }
    }
}
