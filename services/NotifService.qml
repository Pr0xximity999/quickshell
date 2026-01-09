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

        } 
    }
}