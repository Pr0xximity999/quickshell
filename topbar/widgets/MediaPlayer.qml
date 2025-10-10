import QtQuick
import Quickshell
import Quickshell.Services.Mpris


Rectangle {
    id: playerBox
    width: 70
    height: 40
    color: "green"
    property int activePlayer: 0
    property list<MprisPlayer> players : Mpris.players.values
    property MprisPlayer player: players[activePlayer]

    
    MouseArea{
        id: pauseArea
        anchors.fill: parent
        onClicked: () => {
            playerBox.player.togglePlaying();
        }
    }

    Image
    {
        id: trackArt
        source: playerBox.player.trackArtUrl
        asynchronous: true
        fillMode: Image.PreserveAspectCrop
        sourceSize.width: playerBox.width
        sourceSize.height: playerBox.height
    }
    Text{
        id: playerText
        text: playerBox.player.trackTitle ?? "text"  
    }
}
