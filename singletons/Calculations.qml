pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

  function formatSeconds(seconds, format): string {
    var h = "" + Math.floor(seconds / 3600);
    var m = "" + Math.floor(seconds / 60 - (h * 60));
    var s = "" + Math.floor(seconds - (m * 60));

    var formats = format.split(":");
    var timeString = "";
    for(var i = 0; i < formats.length; i++)
    {
      var format = formats[i];

      switch(format[0])
      {
        case "h":
          timeString += `${h.padStart(format.length, "0")}`;
          break;
        case "m":
          timeString += `${m.padStart(format.length, "0")}`;
          break;
        case "s":
          timeString += `${s.padStart(format.length, "0")}`;
          break;
      }
      if(i + 1 < formats.length)
      {
        timeString += ":"
      }
    }
    return timeString
  }
}