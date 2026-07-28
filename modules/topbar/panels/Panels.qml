pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts

import qs.config
import qs.components
import qs.widgets

Item {
    id: root
    readonly property alias clock: clockPanel
    readonly property alias testing_zone: testing_zone
    readonly property alias media: mediaPanel
    property alias itemRow: itemRow

    anchors.fill: parent
    anchors.margins: Appearance.padding.extra_small

    RowLayout {
        id: itemRow
        spacing: 10
        height: root.height
        width: root.width
        anchors {
            top: root.top
            horizontalCenter: root.horizontalCenter
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            width: 1
            StyledRectangle {
                id: clockPanel

                color: Appearance.color.front

                implicitWidth: clock.width
                implicitHeight: Appearance.containerSize.small
                Layout.alignment: Qt.AlignHCenter
                
                ClockWidget {
                    id: clock
                    width: text.width + Appearance.padding.medium
                    height: text.height + Appearance.padding.small
                    text.font.pointSize: Appearance.textSize.normal
                    text.wrapMode: Text.Wrap
                }
            }
           StyledRectangle {
                id: testing_zone
                color: Appearance.color.secondary
                Layout.fillWidth: true
                Layout.fillHeight: true
                opacity: 0
            }
        }

        MediaPanel {
            id: mediaPanel
            width: 0
            Layout.preferredWidth: width
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop

            opacity: 0
        }
    }
}
