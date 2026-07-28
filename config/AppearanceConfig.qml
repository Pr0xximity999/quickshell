pragma ComponentBehavior: Bound

import Quickshell.Io
import qs.config

JsonObject {
    id: root
    property TextSize textSize: TextSize {}
    property ItemWidth itemWidth: ItemWidth {}
    property ContainerSize containerSize: ContainerSize {}
    property IconSize iconSize: IconSize {}
    property Padding padding: Padding {}
    property Color color: Color {dynamic: false}

    component TextSize: JsonObject {
        property int scale: 1
        property int small: 11 * scale
        property int normal: 14 * scale
        property int large: 16 * scale
    }

    component ItemWidth: JsonObject {
        property int scale: 1
        property int notification: 200 * scale
    }

    component ContainerSize: JsonObject {
        property int scale: 1
        property int extra_extra_small: 20 * scale
        property int extra_small: 25 * scale
        property int small: 35 * scale
        property int medium: 50 * scale
        property int large: 70 * scale
        property int extra_large: 100 * scale
    }

    component IconSize: JsonObject {
        property int scale: 1
        property int extra_small: 20 * scale
        property int small: 50 * scale
        property int medium: 100 * scale
        property int large: 150 * scale
        property int extra_large: 250 * scale
    }

    component Padding: JsonObject {
        property int scale: 1
        property int extra_small: 5
        property int small: 10
        property int medium: 20
        property int large: 30
        property int extra_large: 40
    }

    component Color: JsonObject {
        property bool dynamic
        property string debug: "#32ED75ff"
        property string transparent: "transparent"

        property string primary: dynamic ? Themer.color.primary : "#2D353B"
        property string secondary: dynamic ? Themer.color.secondary : "#3C444A"

        property string grey: dynamic ? Themer.color.grey : "#868D80"
        property string lightGrey: dynamic ? Themer.color.lightGrey : "#C8BA9E"
        property string light: dynamic ? Themer.color.light : "#A7C080"

        property string white: dynamic ? Themer.color.white : "#D3C6AA"
        property string black: dynamic ? Themer.color.black : "#1a1f22"

        property string magenta: dynamic ? Themer.color.magenta : "#D699B6"
        property string blue: dynamic ? Themer.color.blue : "#7FBBB3"
        property string lightblue: dynamic ? Themer.color.cyan : "#3A94C5"

        property string red: dynamic ? Themer.color.red : "#E67E80"
        property string orange: dynamic ? Themer.color.yellow : "#E69875"
        property string yellow: dynamic ? Themer.color.yellow : "#DFA000"
        property string green: dynamic ? Themer.color.green : "#A7C080"

        property string back: dynamic ? Themer.color.background : primary
        property string front: dynamic ? Themer.color.foreground : secondary

        property string text: dynamic ? Themer.color.lightGrey : lightGrey
        property string active: dynamic ? Themer.color.light : light
        property string inactive: dynamic ? Themer.color.light : light
        property string selected: dynamic ? Themer.color.light : light
        property string unselected: dynamic ? Themer.color.secondary : secondary
    }
}
