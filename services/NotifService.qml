pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton{
    id: root

    property alias notifications: notifServer.trackedNotifications

    signal notification(notification: Notification)
    
    NotificationServer{
        id: notifServer                    
        actionsSupported: false
        bodySupported: true
        bodyMarkupSupported: true
        bodyImagesSupported: false
        bodyHyperlinksSupported: false
        persistenceSupported: false
        imageSupported: true

        onNotification: notif =>{
            notif.tracked = true       
            root.notification(notif)
            // content.text = notif.summary + "\n" + notif.body

            // background.x_offset = 0
            //const comp = notifComp.createObject();
        } 
    }
    
    component Notif: QtObject {
        id: notif
    }

    Component {
        id: notifComp

        Notif {}
    }
}