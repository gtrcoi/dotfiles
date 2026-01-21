// Bar.qml
import Quickshell

Scope {
  // no more time object

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      StatusIndicator {
        anchors.left: parent
      }
      ClockWidget {
        anchors.centerIn: parent
      }
    }
  }
}
