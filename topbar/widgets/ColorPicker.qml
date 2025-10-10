import QtQuick
import Quickshell

import qs.topbar.components

Item{
    id: root
    property Item target
    property alias picker: colorPicker

    Grid {
        id: colorPicker
        anchors.bottomMargin: 4
        rows: 2; columns: 3; spacing: 3

        ColorCell { cellColor: "red"; onClicked: root.target.color = cellColor}
        ColorCell { cellColor: "green"; onClicked: root.target.color = cellColor }
        ColorCell { cellColor: "blue"; onClicked: root.target.color = cellColor }
        ColorCell { cellColor: "yellow"; onClicked: root.target.color = cellColor }
        ColorCell { cellColor: "steelblue"; onClicked: root.target.color = cellColor }
        ColorCell { cellColor: "black"; onClicked: root.target.color = cellColor }
    }
}