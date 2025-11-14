import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris
import Quickshell.Widgets

import qs.utils
import qs.components
import qs.config
import qs.services


Item {
    id: root
    property MprisPlayer player : MediaPlayers.activePlayer

    // Manually update the player's position since it wont update by default (to save cpu)
    Timer{
        id: positionUpdater

        running: root.player.isPlaying
        interval: 500
        repeat: true

        onTriggered: root.player.positionChanged()
    }
    
    ColumnLayout{
        id: itemColumn
        spacing: 10
        width: root.width

        Component.onCompleted: {
            children.forEach((child) => {  
                child.Layout.alignment= Qt.AlignCenter
            })
        }
        
        StyledText{
            id: playerText
            Layout.preferredWidth: itemColumn.width
            Layout.preferredHeight: 80

            text: root.player.trackTitle ?? "text"  
        }

        ClippingRectangle{
            id: trackArtBox
            radius: Infinity
            implicitWidth: Appearance.iconSize.medium
            implicitHeight: Appearance.iconSize.medium
            antialiasing: true
            contentInsideBorder: true
            color: Appearance.color.back
            border{
                color: Appearance.color.black
                width: 2
            }
            Image
            {
                id: trackArt
                source: root.player.trackArtUrl
                property string previousSource: ""
                

                asynchronous: true
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                anchors.fill: parent
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
                    onWheel: (mouse) => {
                        trackArt.rotation += mouse.angleDelta.y / 20;
                        root.player.seek(mouse.angleDelta.y / 30);
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

        StyledText{
            id: artistName
            text: root.player.trackArtist
            Layout.preferredWidth: trackArt.width
        }

        Item{
            id: musicProgress
            width: trackArtBox.width
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
}