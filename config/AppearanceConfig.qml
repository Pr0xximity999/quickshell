import Quickshell.Io

JsonObject{
    property TextSize textSize: TextSize{}
    property IconSize iconSize: IconSize{}
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

    component Color: JsonObject {
        property string back: "#2D353B"
        property string front: "#3C444A"
        property string text: "#C8BA9E"
    }

    

}
