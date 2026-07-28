pragma Singleton

import Quickshell
import Quickshell.Io

import QtQuick

import qs.utils

Singleton {
    id: root

    property alias json1: json1
    property alias json2: json2

    property var color: JsonObject {

        property string foreground: root.json2.special.foreground
        property string background: root.json2.special.background

        property string black: root.json2.colors.color0
        property string red: root.json2.colors.color1
        property string green: root.json2.colors.color2
        property string yellow: root.json2.colors.color3
        property string blue: root.json2.colors.color4
        property string magenta: root.json2.colors.color5
        property string cyan: root.json2.colors.color6
        property string white: root.json2.colors.color7
        property string grey: root.json1.grey
        property string lightGrey: root.json1.lightGrey
        property string light: root.json1.light

        property string primary: root.json1.primary
        property string secondary: root.json1.secondary
    }

    FileView {
        id: themeconfig1
        path: `${Paths.home}/.config/quickshell/config/theme.json`
        watchChanges: true

        onLoadFailed: error => {
            console.error(`Failed to load themecolors1 file: ${error.toString()}`);
        }

        onFileChanged: {
            console.log("Updated themecolors1 file");
            reload();
        }

        JsonAdapter {
            id: json1

            property string primary
            property string secondary

            property string grey
            property string lightGrey
            property string light
        }
    }

    FileView {
        id: themeconfig2
        path: `${Paths.home}/.cache/wal/colors.json`
        watchChanges: true

        onLoadFailed: error => {
            console.error(`Failed to load themecolors2 file: ${error.toString()}`);
        }

        onFileChanged: {
            console.log("Updated themecolors2 file");
            reload();
        }

        JsonAdapter {
            id: json2

            property JsonObject special: JsonObject {
                property string background
                property string foreground
                property string cursor
            }

            property JsonObject colors: JsonObject {
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
