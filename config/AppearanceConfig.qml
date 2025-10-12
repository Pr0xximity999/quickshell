import Quickshell.Io

JsonObject{
    property TextSize textSize: TextSize{}
    property ClockData clockData: ClockData{}


    component TextSize: JsonObject{
        property int scale: 1
        property int small: 11 * scale
        property int normal: 14 * scale
        property int large: 16 * scale
    }
    
    component ClockData: JsonObject{
        property int size: 14
        property string color: "black"
    }
}
