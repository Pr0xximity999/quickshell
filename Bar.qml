import Quickshell


Scope {
    Variants {
        model: Quickshell.screens

        
            // the screen from the screens list will be injected into
            // this property
            required property var modelData

            // we can then set the window's screen to the injected
            // property
            screen: modelData
            implicitHeight: 60
            implicitWidth: 360

            anchors {
                top: true
                left: false
                right: false
            }

            // ClockWidget.qml
            ClockWidget {
                // center the bar in its parent component (the window)
                anchors.centerIn: parent
            }

        

    }

}
