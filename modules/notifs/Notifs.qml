import QtQuick
import Quickshell
import Quickshell.Services.Notifications

import qs.components
import qs.config
import qs.services

Scope {
    id: root
    PanelWindow {
        id: window
        implicitWidth: 250
        implicitHeight: 150
        color: "transparent"

        // Makes the window overlay the screen
        exclusionMode: ExclusionMode.Ignore

        // Mouse event passtrough
        mask: Region {
            width: listview.width
            height: listview.contentHeight
        }

        anchors {
            top: true
            right: true
            bottom: true
        }

        margins {
            top: 50
            bottom: 20
        }

        // The actual list of notifications
        ListView {
            id: listview

            model: NotifService.notifications
            anchors.fill: parent

            delegate: Notif {
                required property Notification modelData
                notification: modelData
            }
        }
    }

    // The notification component
    component Notif: NotificationElement {
        id: notif

        property int x_offset: 0
        opacity: 0
        x: 0 - x_offset
        anchors.margins: 100

        implicitWidth: Appearance.itemWidth.notification
        implicitHeight: notifItemsColumn.implicitHeight + Appearance.padding.large


        Component.onCompleted: {
            notif.opacity = 1;
        }

        Behavior on x {
            NumberAnimation {
                duration: 400
            }
        }
    }

    Connections {
        target: NotifService

        function onNotification(notif) {
            console.log(notif.summary + ": " + notif.body);
        }
    }
}
