import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


Item {
    Text {
        id: header
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 40
        text: "Result"
    }

    Item {
        id: scores
        height: 100
        width: 200
        anchors.top: header.bottom
        anchors.topMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 100

        Text {
            id: score
            anchors.left: parent.left
            font.pixelSize: 30
            text: "Score:"
        }

        Text {
            anchors.left: score.right
            anchors.leftMargin: 10
            anchors.bottom: score.bottom
            font.pixelSize: 30
            text: _controller.score + " %"
        }

        Text {
            id: time
            anchors.top: score.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            font.pixelSize: 30
            text: "Average response time:"
        }

        Text {
            anchors.left: time.right
            anchors.leftMargin: 10
            anchors.bottom: time.bottom
            font.pixelSize: 30
            text: Math.round(_controller.average_time) / 1000 + " s"
        }
    }

    Rectangle {
        id: replay_button
        anchors.top: scores.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 70
        height: 30
        color: "teal"
        border.color: "black"
        border.width: 2

        Text {
            anchors.centerIn: parent
            text: "Replay"
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: "PointingHandCursor"
            onClicked: {
                parent.parent.parent.source = "GamePage.qml"
            }
        }
    }

    Rectangle {
        anchors.top: replay_button.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 70
        height: 30
        color: "teal"
        border.color: "black"
        border.width: 2

        Text {
            anchors.centerIn: parent
            text: "Menu"
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: "PointingHandCursor"
            onClicked: {
                parent.parent.parent.source = "StartPage.qml"
            }
        }
    }
}
