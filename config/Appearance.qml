pragma Singleton

import Quickshell

Singleton{
    // This purely exists as a shorthand way to write Config.appearance.[anything]
    property AppearanceConfig.TextSize textSize: Config.appearance.textSize
    property AppearanceConfig.IconSize iconSize: Config.appearance.iconSize
    property AppearanceConfig.Padding padding: Config.appearance.padding
    property AppearanceConfig.Color color: Config.appearance.color
}