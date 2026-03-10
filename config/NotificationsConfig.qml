import Quickshell.Io

JsonObject{
    property Props props: Props{}

    component Props: JsonObject{
        property int second: 1000
        property int expiryTimer: 15 * second
    }
}
