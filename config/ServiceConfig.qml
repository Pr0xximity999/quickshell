import Quickshell.Io

JsonObject{
    property Player mpris: Player{}


    component Player: JsonObject{
        property list<var> aliases: [
            {
                "id" : "",
                "name" : ""
            }
        ]
    }

}
