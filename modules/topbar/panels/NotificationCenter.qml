import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Controls

import qs.config
import qs.components
import qs.services

Item {
    id: root
    property alias color: rect.color

    StyledRectangle {
        id: rect
        anchors.fill: parent

        ScrollView {
            anchors.fill: parent
            clip: true
            ListView {
                id: listview

                model: NotifService.notifications
                anchors.fill: parent
                spacing: Appearance.padding.extra_small

                delegate: Notif {
                    required property Notification modelData
                    notification: modelData
                }
            }
        }
    }

    // The notification component
    component Notif: NotificationElement {
        id: notif
        doesExpire: false
        clickToDelete: true
        opacity: 0

        implicitWidth: parent?.width ?? 0
        implicitHeight: notifItemsColumn.implicitHeight

        Component.onCompleted: {
            notif.opacity = 1;
        }
    }
}
