import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Item {
    id: root
    required property MprisPlayer player

    Grid{
        columns: 1
        horizontalItemAlignment: Grid.AlignLeft
        Text{
            id: playerText
            width: root.width
            text: root.player.trackTitle ?? "text"  
            wrapMode: Text.Wrap
        }
        Image
        {
            id: trackArt
            source: root.player.trackArtUrl
            asynchronous: true
            fillMode: Image.PreserveAspectCrop
            sourceSize.width: root.width
            sourceSize.height: root.height
        }
    }
}