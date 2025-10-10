import QtQuick
import Quickshell
import Quickshell.Services.Mpris

import qs.topbar.widgets


Item {
    id: root
    property int pNum: 1
    property list<MprisPlayer> players : Mpris.players.values
    property MprisPlayer activePlayer: players[pNum]

    
    MouseArea{
        id: pauseArea
        anchors.fill: parent
        onClicked: () => {
            root.activePlayer.togglePlaying();
        }
    }

    MediaPlayer{
        id: mediaPlayer
        player: root.activePlayer

        width: 100
        height: 100
    }

}
