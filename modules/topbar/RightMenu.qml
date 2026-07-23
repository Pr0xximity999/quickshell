pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Services.SystemTray

import QtQuick
import QtQuick.Layouts

import qs.config
import qs.components
import qs.modules.topbar.widgets

RowLayout {
    id: root
    spacing: Appearance.padding.extra_small
    required property PanelWindow windowRoot
    layoutDirection: Qt.RightToLeft

    StyledRectangle {
        id: tray
        height: Appearance.containerSize.small
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
}
