pragma Singleton

import Quickshell

Singleton{
    // This purely exists as a shorthand way to write Config.appearance.[anything]
    property AppearanceConfig.TextSize text: Config.appearance.textSize
    property AppearanceConfig.ClockData clock: Config.appearance.clockData
}