pragma Singleton

import Quickshell
import Quickshell.Io

import qs.utils

Singleton {
    id: root
    readonly property alias appearance: adapter.appearance
    readonly property alias service: adapter.service
    readonly property alias notifications: adapter.notifications

    FileView {
        id: file
        path: `${Paths.config}/quickshell/config.json`

        // Updates data if file changed
        watchChanges: true
        onFileChanged: reload()

        // Save data if changes are made to properties
        onAdapterUpdated: writeAdapter()

        onSaved: console.log("Changes written to config file")

        JsonAdapter {
            id: adapter
            property AppearanceConfig appearance: AppearanceConfig {}
            property ServiceConfig service: ServiceConfig {}
            property NotificationsConfig notifications: NotificationsConfig {}
        }
    }
}
