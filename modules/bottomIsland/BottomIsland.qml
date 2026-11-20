pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Qt.labs.folderlistmodel
import QtCore

import qs.config
import qs.components

Variants {
    model: Quickshell.screens

    Scope {
        id: root
        required property ShellScreen modelData

        PanelWindow {
            id: window

            implicitWidth: 1500
            implicitHeight: 500
            exclusionMode: ExclusionMode.Ignore

            color: Appearance.color.transparent
            anchors.bottom: true

            mask: Region {
                item: body
            }

            Rectangle {
                id: body

                implicitWidth: 250
                implicitHeight: 150

                anchors.bottomMargin: -height + 5

                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                topLeftRadius: 10
                topRightRadius: topLeftRadius
                border {
                    color: Appearance.color.secondary
                    width: 3
                }
                color: Appearance.color.back

                HoverHandler {
                    id: hoverer
                }

                ListView {
                    id: listview
                    anchors.fill: parent
                    anchors.margins: Appearance.padding.small

                    clip: true
                    flickableDirection: Flickable.HorizontalFlick
                    boundsBehavior: Flickable.StopAtBounds
                    ScrollBar.horizontal: ScrollBar {}
                    orientation: ListView.Horizontal

                    FolderListModel {
                        id: photosDirectory
                        folder: StandardPaths.standardLocations(StandardPaths.HomeLocation)[0] + "/Pictures/wallpapers/"
                        nameFilters: ["*.jpg", "*.jpeg", "*.png"]
                        showDirs: true
                    }
                    model: photosDirectory
                    spacing: Appearance.padding.extra_small

                    MouseArea {
                        anchors.fill: parent
                        acceptedButtons: Qt.RightButton
                        onWheel: wheel => {
                            var delta = wheel.angleDelta.y;
                            delta = Math.max(0, Math.min(listview.contentWidth - listview.width, listview.contentX - delta));
                            listview.contentX = delta;
                        }
                    }

                    delegate: Rectangle {
                        id: wallpaperRect
                        required property string filePath
                        color: Appearance.color.debug
                        implicitWidth: height / Screen.height * Screen.width //Previews image in relation to the screen
                        height: body.height - Appearance.padding.large
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                wallpaperProc.running = true
                            }
                        }
                        Process{
                            id: wallpaperProc
                            running: false
                            command: ["awww", "img", wallpaperRect.filePath, "-t", "any"]
                        }
                        Image {
                            id: image
                            anchors.fill: parent
                            source: wallpaperRect.filePath
                            asynchronous: true //Optimizes loading
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                }

                states: [
                    State {
                        id: hoverState
                        name: "focussed"
                        when: hoverer.hovered

                        PropertyChanges {
                            body.anchors.bottomMargin: 0
                            body.width: 1200
                        }
                    }
                ]

                transitions: [
                    Transition {
                        to: "focussed"
                        reversible: true

                        SequentialAnimation {
                            NumberAnimation {
                                properties: "bottomMargin"
                                easing.type: Easing.OutQuad
                                duration: 200
                            }
                            NumberAnimation {
                                properties: "width"
                                easing.type: Easing.InOutQuad
                                duration: 200
                            }
                        }
                    }
                ]
            }
        }
    }
}
