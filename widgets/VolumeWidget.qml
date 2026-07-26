import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Item {
    id: root
    property PwNode sink: Pipewire.defaultAudioSink

    readonly property bool muted: (sink?.ready ?? false) && (sink?.audio?.muted ?? false)
    readonly property real volume: (sink?.ready ?? false) ? (sink?.audio?.volume ?? 0) : 0

    readonly property string icon: {
        if (root.muted)
            return "󰖁";
        if (root.volume < 0.35)
            return "";
        if (root.volume < 0.60)
            return "";
        return "";
    }

    Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.fill: parent

        font.bold: true
        text: root.icon + " " + Math.round(root.volume * 100) + "%"
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: mouse => {
            if(mouse.button == Qt.LeftButton)
            {
                root.sink.audio.muted = !root.muted;
            }
            else if (mouse.button == Qt.RightButton)
            {
                Quickshell.execDetached(["pavucontrol", "-t", "3"])
            }
        }

        onWheel: wheel => {
            const step = 0.05;
            const delta = wheel.angleDelta.y > 0 ? step : -step;
            root.sink.audio.volume = Math.max(0, Math.min(1, root.sink.audio.volume + delta));
        }
    }
    PwObjectTracker {
        objects: [root.sink]
    }
}
