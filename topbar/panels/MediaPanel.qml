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
    property MprisPlayer activePlayer: players[pNum]

    ColumnLayout{
        id: itemColumn
        width: parent.width
        height: parent.height
        MediaPlayer{
            id: mediaPlayer
            player: root.activePlayer
            width: itemColumn.width
            Layout.fillHeight: true
            height: 7
        }
        ColumnLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true
            height: 3
            Repeater {
                id: playerList
                model: root.players
                Component.onCompleted: console.log(root.players.length)

                StyledButton {
                    required property MprisPlayer modelData
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    text: modelData.identity
                    highlighted: modelData === root.activePlayer
                    onClicked: root.activePlayer = modelData
                }
            }
        }
    }
}
