pragma ComponentBehavior: Bound
pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property alias data: data

    FileView {
        id: file
        path: "./config.json"

        // Updates data if file changed
        watchChanges: true
        onFileChanged: reload()

        // Save data if changes are made to properties
        onAdapterUpdated: writeAdapter()

        JsonAdapter{
            id: data
            property int clockTextSize: 12
            property string clockTextColor: "black"
        }
    }
}