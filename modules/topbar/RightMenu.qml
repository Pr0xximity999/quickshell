import Quickshell.Services.SystemTray

import QtQuick
import QtQuick.Layouts

import qs.config
import qs.components

RowLayout {
    id: root
    spacing: Appearance.padding.extra_small

    StyledRectangle {
        height: Appearance.containerSize.small
        width: Appearance.containerSize.large

        RowLayout {

            Repeater {
                model: SystemTray.items

                StyledRectangle {
                    id: trayItem
                    required property SystemTrayItem modelData

                    color: Appearance.color.black
                    height: Appearance.containerSize.extra_small + 2
                    width: Appearance.containerSize.extra_small + 2

                    Image {
                        source: trayItem.modelData.icon
                        fillMode: Image.PreserveAspectCrop
                        sourceSize {
                            width: parent.width
                            height: parent.height
                        }

                        MouseArea {
                            id: clickarea
                            anchors.fill: parent
                            acceptedButtons: Qt.LeftButton | Qt.RightButton
                          

                            onClicked: function(mouse){
                              console.log(trayItem.modelData.hasMenu)
                              if(mouse.button == Qt.RightButton)
                              {
                                trayItem.modelData.activate();
                              }
                              else{
                                trayItem.modelData.secondaryActivate();
                              }
                            }
                        }
                    }
                }
            }
        }
    }
}
