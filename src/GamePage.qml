import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3


Rectangle {
    anchors.fill: parent

    property double start_time: 0
    property double countdown_time_init: 0
    property int countdown_time: 3

    function generate_factor() {
        var numbers = _controller.get_random()
        question_text.text = numbers[0] + " x " + numbers[1];
        start_time = new Date().getTime()
    }

    Item {
        id: question_frame
        anchors.centerIn: parent
        width: question_text.width + input_field.width + 10
        height: question_text.height + input_field.height + 10

        Text {
            id: time_text
            anchors.bottom: question_text.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 30
            color: "red"
            text: countdown_time
            visible: false
        }

        Text {
            id: question_text
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 40
            text: ""
        }

        TextField {
            id: input_field
            anchors.top: question_text.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            width: 150
            height: 36
            readOnly: true
            selectByMouse: true
            focus: true

            color: "black"
            font.pixelSize: 24

            validator: IntValidator {bottom: 0; top: 1000000}

            Keys.onReturnPressed: {
                var answer = input_field.text
                if (answer !== "") {
                    var time = new Date().getTime() - start_time
                    _controller.check_answer(answer, time)

                    if (_controller.n_answers === _controller.n_questions) {
                        _controller.compute_result()
                        parent.parent.parent.source = "ResultPage.qml"
                    }
                    else
                        generate_factor()
                    input_field.clear()
                }
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

                input_field.forceActiveFocus()
                generate_factor()
                input_field.readOnly = false
            }
        }
    }

    Component.onCompleted: {
        time_text.visible = true
        countdown_time_init = new Date().getTime()
        countdown_timer.running = true
    }
}
