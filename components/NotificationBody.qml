import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications
import Quickshell
import qs.components
import qs.config

Item {
    id: root
    required property Notification notification
    readonly property alias notifItemsColumn: notifItemsColumn

    Behavior on opacity {
        NumberAnimation {
            duration: 200
        }
    }

    StyledRectangle {
        id: notif
        implicitWidth: parent.width
        implicitHeight: parent.height

        anchors.fill: parent
        color: Appearance.color.back

        border {
            color: Appearance.color.light
            width: 2
        }

        Item {
            Timer {
                id: dismisser
                interval: 200
                onTriggered: {
                    root.notification.dismiss()
                }
            }
            Timer {
                id: expireTimer
                running: true
                interval: Notifications.props.expiryTimer
                repeat: false
                onTriggered: {
                    root.opacity = 0;
                    dismisser.start();
                }
            }
        }

        // Dismiss mosue area
        MouseArea {
            id: clickarea
            width: notif?.width
            height: notif?.height

            onClicked: () => {
                root.opacity = 0;
                dismisser.start();
            }
        }

        // The actual notification visuals
        ColumnLayout {
            id: notifItemsColumn

            anchors.fill: parent
            Layout.fillWidth: true
            Layout.fillHeight: true

            spacing: Appearance.padding.extra_small
            ColumnLayout {
                spacing: 0

                RowLayout {
                    Image {
                        id: notifIcon

                        visible: root.notification?.image ?? "" != ""
                        source: root.notification.image
                        Layout.preferredWidth: Appearance.iconSize.small
                        Layout.preferredHeight: Appearance.iconSize.small
                    }
                    StyledText {
                        id: notifAppname

                        visible: root.notification?.appName ?? "" != ""
                        font.pointSize: Appearance.textSize.normal
                        Layout.fillWidth: true
                        Layout.preferredHeight: font.pointSize * lineCount * 2

                        text: `[${root.notification.appName}]`
                    }
                }
                StyledText {
                    id: notifSummary

                    font.pointSize: Appearance.textSize.small
                    Layout.fillWidth: true
                    Layout.preferredHeight: font.pointSize * lineCount * 2

                    text: root.notification?.summary ?? "You shouldn't be seeing this"
                }
            }

            ColumnLayout {
                spacing: Appearance.padding.small
                StyledText {
                    id: notifBody

                    Layout.fillWidth: true
                    maximumLineCount: 5
                    elide: Text.ElideRight //Makes ... if thext is too long

                    text: root.notification?.body ?? "You shouldn't be seeing this"
                }
                Rectangle {
                    id: durationBar

                    Layout.preferredHeight: Appearance.padding.extra_small
                    Layout.preferredWidth: notifItemsColumn.width - Appearance.padding.extra_small

                    color: Appearance.color.light

                    Component.onCompleted: {
                        Layout.preferredWidth = 0;
                    }
                    Behavior on Layout.preferredWidth {
                        NumberAnimation {
                            duration: Notifications.props.expiryTimer
                        }
                    }
                }
            }
        }
    }
}
