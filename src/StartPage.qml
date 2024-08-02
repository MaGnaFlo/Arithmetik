import QtQuick
import QtQuick.Window
import QtQuick.Controls.iOS 2.0
import QtQuick.Layouts 1.3

Rectangle {
    anchors.fill: parent

    property int mood: 3
    property int motivation: 3
    property int difficulty: 1

    RowLayout {
        id: mood_radio
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
        spacing: 20

        Text {
            text: "Mood:"
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "1"
            }

            onCheckedChanged: {
                mood = 1
            }
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "2"
            }

            onCheckedChanged: {
                mood = 2
            }
        }

        RadioButton {
            checked: true
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "3"
            }

            onCheckedChanged: {
                mood = 3
            }
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "4"
            }

            onCheckedChanged: {
                mood = 4
            }
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "5"
            }

            onCheckedChanged: {
                mood = 5
            }
        }
    }

    RowLayout {
        id: motivation_radio
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: mood_radio.bottom
        anchors.topMargin: 50
        spacing: 20

        Text {
            text: "Motivation:"
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "1"
            }

            onCheckedChanged: {
                motivation = 1
            }
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "2"
            }

            onCheckedChanged: {
                mood = 2
            }
        }

        RadioButton {
            checked: true
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "3"
            }

            onCheckedChanged: {
                mood = 3
            }
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "4"
            }

            onCheckedChanged: {
                mood = 4
            }
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "5"
            }

            onCheckedChanged: {
                mood = 5
            }
        }
    }

    Rectangle {
        id: start_button
        anchors.centerIn: parent
        anchors.top: motivation_radio.bottom
        anchors.topMargin: 50

        width: 120
        height: 60
        color: "teal"
        border.width: 2
        border.color: "black"

        Text {
            anchors.centerIn: parent
            font.pixelSize: 20
            color: "white"
            text: "Start"
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: "PointingHandCursor"
            onClicked: {
                _controller.setMood(mood)
                _controller.setMotivation(motivation)
                _controller.setDifficulty(difficulty)
                parent.parent.parent.source = "GamePage.qml"
            }
        }
    }

    RowLayout {
        id: difficulty_radio
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: start_button.bottom
        anchors.topMargin: 50
        spacing: 30

        Text {
            text: "Difficulty:"
        }

        RadioButton {
            checked: true
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                text: "1x1"
            }

            onCheckedChanged: {
                difficulty = 1
            }
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                text: "1x2"
            }

            onCheckedChanged: {
                difficulty = 2
            }
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                text: "2x2"
            }

            onCheckedChanged: {
                difficulty = 3
            }
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                text: "1x3"
            }

            onCheckedChanged: {
                difficulty = 4
            }
        }

        RadioButton {
            checked: false
            contentItem: Text {
                anchors.top: parent.bottom
                anchors.left: parent.left
                text: "2x3"
            }

            onCheckedChanged: {
                difficulty = 5
            }
        }
    }
}
