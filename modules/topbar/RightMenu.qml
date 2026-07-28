pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Services.SystemTray

import QtQuick
import QtQuick.Layouts

import qs.config
import qs.components
import qs.widgets

RowLayout {
    id: root
    spacing: Appearance.padding.extra_small
    required property PanelWindow windowRoot
    layoutDirection: Qt.RightToLeft

    PowerButtonWidget {
       id: power
        implicitWidth: Appearance.containerSize.small
        implicitHeight: Appearance.containerSize.small
    }

    StyledRectangle {
        id: tray
        implicitHeight: Appearance.containerSize.small
        Layout.preferredWidth: systemTray.implicitWidth

        SystemTrayWidget {
            id: systemTray
            windowRoot: root.windowRoot

            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    StyledRectangle {
        id: volume
        implicitWidth: Appearance.containerSize.large
        implicitHeight: Appearance.containerSize.small

        color: Appearance.color.red

        VolumeWidget {
            anchors.fill: parent
        }
    }

    StyledRectangle {
        id: bluetooth
        implicitWidth: Appearance.containerSize.large
        implicitHeight: Appearance.containerSize.small

        color: Appearance.color.blue

        BluetoothWidget {
            anchors.fill: parent
        }
    }
}
