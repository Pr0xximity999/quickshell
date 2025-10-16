import Quickshell.Io

JsonObject{
    property TextSize textSize: TextSize{}
    property IconSize iconSize: IconSize{}
    property Padding padding: Padding{}
    property Color color: Color{}


    component TextSize: JsonObject{
        property int scale: 1
        property int small: 11 * scale
        property int normal: 14 * scale
        property int large: 16 * scale
    }

    component IconSize: JsonObject{
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
        property string primary: "#2D353B"
        property string secondary: "#3C444A"
        property string grey: "#868D80"
        property string lightGrey: "#C8BA9E"
        property string light: "#A7C080"
        property string black: '#1a1f22'


        property string back: primary
        property string front: secondary
        property string text: lightGrey
        property string active: light
        property string inactive: light
        property string selected: light
        property string unselected: secondary
    }
}
