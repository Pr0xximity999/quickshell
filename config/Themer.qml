pragma Singleton

import Quickshell
import Quickshell.Io

import QtQuick

import qs.utils

Singleton {
    id: root
    
    property alias json: json
    property var colors: JsonObject {
        property var special: root.json.special
        property var colors: root.json.colors
        property string foreground: special.foreground
        property string background: special.background
        property string black: colors.color0
        property string red: colors.color1
        property string green: colors.color2
        property string yellow: colors.color3
        property string blue: colors.color4
        property string magenta: colors.color5
        property string cyan: colors.color6
        property string white: colors.color7
    }

    FileView {
        id: themeconfig
        path: `${Paths.home}/.cache/wal/colors.json`
        watchChanges: true
    
        onLoadFailed: (error) => {
            console.error(`Failed to load themecolors file: ${error.toString()}`)
        }

        onFileChanged: {
            console.log("Updated themecolors file")
            reload();
        }

        JsonAdapter {
            id: json

            property var special: JsonObject {
                property string background
                property string foreground
                property string cursor
            }

            property var colors: JsonObject {
                property string color0
                property string color1
                property string color2
                property string color3
                property string color4
                property string color5
                property string color6
                property string color7
                property string color8
                property string color9
                property string color10
                property string color11
                property string color12
                property string color13
                property string color14
                property string color15
            }
        }
    }
}
