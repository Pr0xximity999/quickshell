import QtQuick
import Quickshell
import Quickshell.Services.Notifications

import qs.components
import qs.config
import qs.services

Scope{
    id: root
    PanelWindow{
        property Notifs modelData
        id: window
        implicitWidth: 300
        implicitHeight: 300
        color: "transparent"

        // Makes the window overlay the screen
        exclusionMode: ExclusionMode.Ignore

        anchors{
            top: true
            right:true
        }

        mask: Region{
            item: background
        }

        margins{
            top: 50
            right: background.width - window.width - background.x_offset
        }
        

        StyledRectangle{
            id: background
            implicitWidth: 200
            implicitHeight: 100
            property int x_offset: 0

            color: Appearance.color.back
            border{
                color: Appearance.color.light
                width: 2
            }

            MouseArea{
                id: clickarea
                width: background.width
                height: background.height

                onClicked: background.x_offset = background.width
            }

            StyledText{
                id: content
                anchors.fill: parent
                anchors.margins: Appearance.padding.extra_small
            }
        }
    }
}