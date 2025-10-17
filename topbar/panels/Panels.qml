pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts

import qs.topbar.panels
import qs.config
import qs.components

Item{
    id: root
    readonly property alias clock: clockPanel
    readonly property alias testing_zone: testing_zone
    readonly property alias media: mediaPanel
    property alias itemRow: itemRow

    anchors.fill: parent

    RowLayout{
        id: itemRow
        spacing: 10
        height: root.height
        width: root.width
        anchors{
            top: root.top
            horizontalCenter: root.horizontalCenter
        }

        ColumnLayout{
            Layout.fillHeight: true
            Layout.fillWidth: true
            width: 1
            ClockPanel{
                id: clockPanel
                Layout.preferredWidth: width
                Layout.preferredHeight:  Math.min(30, root.height)
                Layout.alignment: Qt.AlignHCenter
            }
            StyledRectangle{
                id: testing_zone
                color: Appearance.color.secondary
                Layout.fillWidth: true
                Layout.fillHeight: true
                opacity: 0
            }
        }

        MediaPanel{
            id: mediaPanel
            width: 0
            Layout.preferredWidth: width
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop

            opacity: 0
        }
    }
}