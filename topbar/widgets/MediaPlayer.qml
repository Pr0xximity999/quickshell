import QtQuick
import QtQuick.Controls
import Quickshell.Services.Mpris

import qs.utils
import qs.components
import qs.config


Item {
    id: root
    required property MprisPlayer player

    implicitHeight: playerText.height + trackArt.height + musicProgress.height + 50

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
        StyledText{
            id: playerText
            width: trackArt.width

            font.bold: true

            text: root.getTrackText() ?? "text"  
            wrapMode: Text.WrapAnywhere
        }

        Image
        {
            id: trackArt
            source: root.player.trackArtUrl
            asynchronous: true
            fillMode: Image.PreserveAspectCrop
            sourceSize.width: Appearance.iconSize.medium
            sourceSize.height: Appearance.iconSize.medium
            antialiasing: true
        }

        Item{
            id: musicProgress
            width: root.width
            height: 15
            Column{
                StyledText{
                    text: `${Calculations.formatSeconds(root.player.position, "mm:ss")}/${Calculations.formatSeconds(root.player.length, "mm:ss")}`
                }
                StyledProgressBar{
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