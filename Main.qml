import QtQuick
import QtQuick.VirtualKeyboard

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
        // The rotated content
        Text {
            text: qsTr("Hello World")
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit();
            }
        }
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: root.height
        width: root.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: root.height - inputPanel.height
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
