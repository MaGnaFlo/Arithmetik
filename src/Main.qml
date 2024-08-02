import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Arithmetik")

    Loader {
        anchors.fill: parent
        source: "CalibrationPage.qml"
    }

}
