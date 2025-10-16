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

                Item{
                    id: testItem
                    property bool expand: false
                    property int buttonsCount: 4
                    property int clickedNum: 0

                    anchors.centerIn: parent
                    width: 120; height: 30

                    Repeater{
                        model: testItem.buttonsCount
                        StyledButton{
                            required property int modelData
                            property bool selected: testItem.expand || modelData == testItem.clickedNum

                            width: testItem.width; height: testItem.height
                            y: modelData == testItem.clickedNum ?  0 : testItem.height * (modelData - testItem.clickedNum)

                            visible: selected
                            opacity: selected ? 1 : 0

                            onClicked: {
                                testItem.clickedNum = modelData
                                testItem.expand = !testItem.expand
                            }
                            text: "button " + modelData
                        }
                    }
                }

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