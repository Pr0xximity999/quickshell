pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
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
        spacing: 10
        MediaPlayer{
            id: mediaPlayer
            player: root.activePlayer
            width: root.width
            Layout.fillHeight: true
        }
        Repeater {
            id: playerList

            model: root.players

            MenuItem {
                required property MprisPlayer modelData

                Layout.fillWidth: true
                Layout.fillHeight: true

                text: modelData.identity
                highlighted: modelData === root.activePlayer
                hoverEnabled: false
                onTriggered: root.activePlayer = modelData
            }
        }
    }
}
