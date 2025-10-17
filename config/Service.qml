pragma Singleton

import Quickshell

Singleton{
    // This purely exists as a shorthand way to write Config.appearance.[anything]
    property ServiceConfig.Player player: Config.service.player
}