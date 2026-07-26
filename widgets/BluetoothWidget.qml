import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.services

Item {
    id: root
    
    RowLayout {
        id: layout
        anchors.fill: parent

        Text {
            text: ""
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            text: BluetoothService.defaultAdapter.enabled ? "On" : "Off"
            font.bold: true
        }
    }

    MouseArea{
        anchors.fill: parent
    }
}
