pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

  readonly property string time: {
    // The passed format string matches the default output of
    // the `date` command.
    Qt.formatDateTime(clock.date, "ddd MMM d hh:mm:ss AP t yyyy")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}