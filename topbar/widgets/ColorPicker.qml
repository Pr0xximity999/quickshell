import QtQuick
import qs.components

Item{
    id: root
    property Item target
    property alias picker: colorPicker

    Grid {
        id: colorPicker
        anchors.bottomMargin: 4
        rows: 2; columns: 3; spacing: 3

        ColorCell { cellColor: "red"; onClicked: (cellColor)=> { root.target.color = cellColor}}
        ColorCell { cellColor: "green"; onClicked: (cellColor)=> { root.target.color = cellColor}}
        ColorCell { cellColor: "blue"; onClicked: (cellColor)=> { root.target.color = cellColor}}
        ColorCell { cellColor: "yellow"; onClicked: (cellColor)=> { root.target.color = cellColor}}
        ColorCell { cellColor: "steelblue"; onClicked: (cellColor)=> { root.target.color = cellColor}}
        ColorCell { cellColor: "black"; onClicked: (cellColor)=> { root.target.color = cellColor}}
    }
}