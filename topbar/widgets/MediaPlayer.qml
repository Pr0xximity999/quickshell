import QtQuick
import Quickshell.Services.Mpris

import qs.singletons

Item {
    id: root
    required property MprisPlayer player

    implicitHeight: playerText.height + trackArt.height + musicProgress.height + 20

    // Manually update the player's position since it wont update by default (to save cpu)
    Timer{
        id: positionUpdater

        running: root.player.isPlaying
        interval: 500
        repeat: true

        onTriggered: root.player.positionChanged()
    }
    
    Column{
        spacing: 10
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
            sourceSize.height: 100
        }
        Item{
            id: musicProgress
            width: root.width
            height: 15
            Column{
                Text{
                    text: `${Calculations.formatSeconds(root.player.position, "mm:ss")}/${Calculations.formatSeconds(root.player.length, "mm:ss")}`
                }
                ProgressBar{
                    max: root.player.length
                    current: root.player.position
                    
                    width: root.width
                    height: 5
                }
            }
        }
    }

    function getTrackText(): string {
        return `<${root.player.identity}>\n${root.player.trackArtist}:\n${root.player.trackTitle}`
    }
}