pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton{
    id: root
    
    NotificationServer{
        id: notifServer                    

        onNotification: notif =>{
            notif.tracked = false
            console.log("hi")
            // content.text = notif.summary + "\n" + notif.body

            // background.x_offset = 0
            const comp = notifComp.createObject();
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