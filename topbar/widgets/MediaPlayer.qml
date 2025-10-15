import QtQuick
import Quickshell.Services.Mpris
import Quickshell.Widgets

import qs.utils
import qs.components
import qs.config


Item {
    id: root
    required property MprisPlayer player
    
    implicitHeight: itemColumn.height
    implicitWidth: itemColumn.width

    width: root.width
    height: root.height

    // Manually update the player's position since it wont update by default (to save cpu)
    Timer{
        id: positionUpdater

        running: root.player.isPlaying
        interval: 500
        repeat: true

        onTriggered: root.player.positionChanged()
    }
    
    Column{
        id: itemColumn
        spacing: 10

        
        StyledText{
            id: playerText
            width: root.width
            height: 75

            font.bold: true

            text: root.getTrackText() ?? "text"  
        }

        ClippingRectangle{
            id: trackArt
            radius: Infinity
            implicitWidth: Appearance.iconSize.medium
            implicitHeight: Appearance.iconSize.medium
            antialiasing: true
            contentInsideBorder: true
            border{
                color: Appearance.color.black
                width: 2
            }
            Image
            {
                source: root.player.trackArtUrl
                asynchronous: true
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                fillMode: Image.PreserveAspectCrop

                Rectangle{
                    width: 10
                    height: 10
                    radius: Infinity
                    color: Appearance.color.back
                    anchors.centerIn: parent
                    border.color: Appearance.color.black
                }

                MouseArea{
                    id: pauseArea
                    anchors.fill: parent
                    onClicked: () => {
                        root.player.togglePlaying();
                    }
                }
            }
            
            NumberAnimation on rotation{
                id: rotation
                from: 0
                to: 360
                loops: Animation.Infinite
                duration: 30000
                paused: !root.player.isPlaying
            }
            
        }

        Item{
            id: musicProgress
            width: trackArt.width
            height: 15
            Column{
                StyledText{
                    text: `${Calculations.formatSeconds(root.player.position, "mm:ss")}/${Calculations.formatSeconds(root.player.length, "mm:ss")}`
                }
                StyledProgressBar{
                    max: root.player.length
                    current: root.player.position
                    
                    width: musicProgress.width
                    height: 5
                }
            }
        }
    }

    function getTrackText(): string {
        return `${root.player.trackArtist} - ${root.player.trackTitle}`
    }
}