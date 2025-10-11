pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris

import qs.topbar.widgets


Item {
    id: root
    property int pNum: 0
    property list<MprisPlayer> players : Mpris.players.values
    property MprisPlayer activePlayer: players[pNum]
    
    MouseArea{
        id: pauseArea
        anchors.fill: parent
        onClicked: () => {
            root.activePlayer.togglePlaying();
        }
    }
    ColumnLayout{
        MediaPlayer{
            id: mediaPlayer
            player: root.activePlayer

            width: 100
        }
        Repeater {
            id: playerList

            model: root.players

            MenuItem {
                required property MprisPlayer modelData

                width: root.width

                text: modelData.identity
                highlighted: modelData === root.activePlayer
                hoverEnabled: false
                onTriggered: root.activePlayer = modelData
            }
        }
    }
}
