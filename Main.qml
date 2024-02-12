import QtQuick
import QtQuick.VirtualKeyboard
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root
    visible: true

    // Container element for rotating
    Rectangle {
        id: main
        // Swap the width and height of the root item
        width: root.height
        height: root.width
        anchors.centerIn: parent
        // Rotate 90 degrees clockwise around transformOrigin
        rotation: 90

        ColumnLayout {
            id: column
            anchors.centerIn: parent

            Text {
                text: qsTr("Hello World")
            }
            RoundButton {
                text: "Show keyboard"
                onClicked: {
                    inputPanel.active = !inputPanel.active
                }
            }
        }

        InputPanel {
            id: inputPanel
            z: 99
            x: 0
            y: parent.height
            width: parent.width

            states: State {
                name: "visible"
                when: inputPanel.active
                PropertyChanges {
                    target: inputPanel
                    y: parent.height - inputPanel.height
                }
            }
            transitions: Transition {
                from: ""
                to: "visible"
                reversible: true
                ParallelAnimation {
                    NumberAnimation {
                        properties: "y"
                        duration: 250
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }
}
