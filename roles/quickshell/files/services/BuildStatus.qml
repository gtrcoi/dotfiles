pragma Singleton
import Quickshell
import QtQuick

Singleton {
    property bool falled: false
    property string lastError: ""

    Connections {
        target: Quickshell
        function onReloadStarted() {
            falled = false;
        }
        function onReloadFailed(error) {
            falled = true;
            lastError = error;
            console.log("Watchdog caught error: " + error);
        }
    }
}
