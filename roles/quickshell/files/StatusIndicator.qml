import QtQuick
import "." // Access our singletons

Rectangle {
    width: 4
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    
    // Binding directly to the Singleton's state
    color: BuildStatus.falled ? "red" : "green"
}
