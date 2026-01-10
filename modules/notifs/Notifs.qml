import QtQuick
import QtQuick.Layouts
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

        // Mouse event passtrough
        mask: Region{
            width: listview.width
            height: listview.contentHeight
        }

        anchors{
            top: true
            right:true
            bottom:true
        }

        margins{
            top: 50
            bottom: 20
        }

        ListView{
            id: listview
            model: NotifService.notifications
            anchors.fill: parent
            spacing: Appearance.padding.small

            delegate: Notif {
                required property Notification modelData
                notification: modelData
            }
        }
 
        component Notif: StyledRectangle{
            id: notif
            property int x_offset: 0
            required property Notification notification

            implicitWidth: Appearance.itemWidth.notification
            implicitHeight: notifItems.implicitHeight + Appearance.padding.large
            color: Appearance.color.back

            opacity: 0
            x: 0 - x_offset

            
            Component.onCompleted: {
                notif.opacity = 1
            }


            border{
                color: Appearance.color.light
                width: 2
            }

            Item{
                Timer {
                    id: dismisser
                    interval: 200
                    onTriggered: 
                    {
                        notif.notification.dismiss()
                    }
                }
            }

            MouseArea{        
                id: clickarea
                width: notif?.width
                height: notif?.height

                onClicked: () => {
                    notif.opacity = 0
                    dismisser.start()
                }
            }

            ColumnLayout{
                id: notifItems
                anchors.fill: parent

                spacing: Appearance.padding.small

                StyledText{
                    id: notifTitle
                    font.pointSize: Appearance.textSize.normal
                    Layout.fillWidth: true
                    Layout.preferredHeight: font.pointSize * lineCount

                    text: `${notif.notification?.appName}` +
                        notif.notification?.summary ?? "You shouldn't be seeing this"


                }

                StyledText{
                    id: notifBody
                    Layout.fillWidth: true
                    maximumLineCount: 5
                    elide: Text.ElideRight //Makes ... if thext is too long

                    text: notif.notification?.body ?? "You shouldn't be seeing this"
                }
            }



            Behavior on opacity {
                NumberAnimation {duration: 200}
            }

            Behavior on x {
                NumberAnimation {duration: 400}
            }
        }
    }

    Connections{
        target: NotifService

        function onNotification(notif){
            console.log(notif.summary + ": " + notif.body)
        }
    }
}