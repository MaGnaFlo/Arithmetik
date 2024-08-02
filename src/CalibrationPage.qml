import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3


Rectangle {
    anchors.fill: parent

    property double start_time: 0
    property double time: 0
    property int number: 0
    property bool number_visible: false
    property int n_answers: 0
    property double countdown_time_init: 0
    property int countdown_time: 3

    Text {
        id: header
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 40
        text: "Calibration"
    }

    Text {
        id: header2
        anchors.top: header.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        text: "Please type the numbers below as quickly as possible."
    }

    Rectangle {
        id: start_button
        anchors.top: header2.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 70
        height: 30
        color: "teal"
        border.color: "black"
        border.width: 2

        Text {
            anchors.centerIn: parent
            text: "Go!"
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: "PointingHandCursor"
            onClicked: {
                parent.visible = false
                countdown_time_init = new Date().getTime()
                countdown_timer.running = true
                time_text.visible = true
            }
        }
    }

    Timer {
        id: countdown_timer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            countdown_time = 3 - Math.floor((new Date().getTime() - countdown_time_init)/1000)
            if (countdown_time === 0) {
                stop()
                time_text.visible = false

                number = Math.floor(Math.random()*10)
                number_visible = true
                input_field.forceActiveFocus()
            }
        }
    }

    Text {
        id: time_text
        anchors.top: start_button.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30
        color: "red"
        text: countdown_time
        visible: false
    }

    Item {
        anchors.centerIn: parent
        width: question_text.width + input_field.width + 10
        height: question_text.height + input_field.height + 10

        Text {
            id: question_text
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 40
            visible: number_visible
            text: number
        }

        TextField {
            id: input_field
            anchors.top: question_text.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            width: 150
            height: 36
            readOnly: !number_visible
            selectByMouse: true
            focus: true

            color: "black"
            font.pixelSize: 24

            validator: IntValidator {bottom: 0; top: 9}

            Keys.onReturnPressed: {
                if (number_visible & input_field.text !== "") {
                    n_answers += 1
                    time = new Date().getTime() - start_time

                    if (n_answers === 10) {
                        _controller.reaction_time += time / 10
                        parent.parent.parent.source = "StartPage.qml"
                    }
                    else
                        number = Math.floor(Math.random()*10)
                    input_field.clear()
                    start_time = new Date().getTime()
                }
            }
        }
    }

    Component.onCompleted: {
        start_time = new Date().getTime()
        input_field.forceActiveFocus()
    }
}
