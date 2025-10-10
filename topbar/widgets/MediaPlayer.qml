import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Item {
    id: root
    required property MprisPlayer player

    Grid{
        columns: 1
        spacing: 10
        horizontalItemAlignment: Grid.AlignLeft
        Text{
            id: playerText
            width: root.width

            text: root.getTrackText() ?? "text"  
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
        
        Rectangle {
            id: progessBar
            height: 20
            width: root.width
            radius: 5
            color: "grey"
            Rectangle {
                height: parent.height
                width: parent.width / root.player.length * root.player.position
                radius: 5
                color: "black"
            }
        }
    }

    function getTrackText(): string {
        return `<${root.player.identity}>\n${root.player.trackArtist}:\n${root.player.trackTitle}`
    }
}