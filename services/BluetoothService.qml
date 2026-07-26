pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Bluetooth

Singleton{
    id: root
    
    property list<var> adapters: Bluetooth.adapters
    property BluetoothAdapter defaultAdapter: Bluetooth.defaultAdapter
    property bool defaultEnabled: defaultAdapter.enabled

    property list<var> devices: Bluetooth.devices
    property list<BluetoothDevice> pairedDevices: devices.filter((device) => {return device?.paired ?? false})
}
