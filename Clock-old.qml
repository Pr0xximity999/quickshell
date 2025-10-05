// Turn this file into a singleton 
// (can be used globally, theres only one instance)


import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    readonly property string time

    // Create a process management object
    Process {
        id: dateProc

        command: ["date"]
        running: true

        // Process the stdout stream using a Stdiocollector
        // Use StdioCollector to retrieve the text the process sends to stdout
        stdout: StdioCollector {
            // Listen for the steamFinished signal, which is sent
            // when the process closes stdout or exists.
            onStreamFinished: {
                root.time = this.text;
            }
        }

    }

    // Use a timer to rerun the process at an interval
    Timer {
        interval: 1000 // 1000 ms
        running: true // Start imediately
        repeat: true // Rerun the timer when it runs out
        // When the timer is triggered, set the running property
        // of the process to true, which reruns it if it's stopped
        onTriggered: dateProc.running = true
    }

}
