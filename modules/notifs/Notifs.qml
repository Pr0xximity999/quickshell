pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

import qs.components
import qs.config
import qs.services

Scope{
    id: root
    PanelWindow {
        id: window
        implicitWidth: 250
        implicitHeight: 150
        color: "transparent"

        // Makes the window overlay the screen
        exclusionMode: ExclusionMode.Ignore

        anchors{
            top: true
            right:true
            bottom:true
        }

        margins{
            top: 50
            bottom: 20
        }

        mask: Region{
            item: window.contentItem
        }
    
        component Notif: StyledRectangle{
            id: notif
            implicitWidth: 200
            implicitHeight: 100

            opacity: 0

            property int x_offset: 0
            required property Notification notification

            color: Appearance.color.back

            Component.onCompleted: {
                notif.opacity = 1
            }

            // notification.onClosed:{
            //     destroyTimer.running = true  
            // } 

            border{
                color: Appearance.color.light
                width: 2
            }

            Item{
                Timer {
                    id: destroyTimer
                    interval: 200
                    onTriggered: 
                    {
                        notif.notification.dismiss()
                        notif.destroy()
                    }
                }
            }

            MouseArea{        
                id: clickarea
                width: notif?.width
                height: notif?.height

                onClicked: () => {
                    // notif.opacity = 0
                    destroyTimer.running = true
                }
            }

            StyledText{
                id: content
                anchors.fill: parent
                anchors.margins: Appearance.padding.extra_small
                text: notif.notification?.body ?? "You shouldn't be seeing this"
            }

            Behavior on opacity {
                NumberAnimation {duration: 200}
            }
        }
        
    }

    Component{
        id: notifComp
        Notif{}
    }
    Connections{
        target: NotifService
        
        function onNotification(n){
            console.log(n.summary + ": " + n.body)

            const notif = notifComp.createObject(
                window.contentItem,
                {
                    notification: n
                }
            );
        }
    }
}