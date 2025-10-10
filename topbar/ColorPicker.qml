import QtQuick

Grid {
    id: colorPicker
    property Item target
    x:4; anchors.bottom: parent.bottom; anchors.bottomMargin: 4
    rows: 2; columns: 3; spacing: 3

    ColorCell { cellColor: "red"; onClicked: colorPicker.target.color = colorPicker}
    ColorCell { cellColor: "green"; onClicked: colorPicker.target.color = cellColor }
    ColorCell { cellColor: "blue"; onClicked: colorPicker.target.color = cellColor }
    ColorCell { cellColor: "yellow"; onClicked: colorPicker.target.color = cellColor }
    ColorCell { cellColor: "steelblue"; onClicked: colorPicker.target.color = cellColor }
    ColorCell { cellColor: "black"; onClicked: colorPicker.target.color = cellColor }
}