/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.2
import QtQuick.Controls 6.2
import Basics

Rectangle {
    id: rectangle
    width: 800
    height: 600

    color: Constants.backgroundColor

    Button {
        id: button
        text: qsTr("Press me")
        anchors.verticalCenter: parent.verticalCenter
        checkable: true
        anchors.horizontalCenter: parent.horizontalCenter

        Connections {
            target: button
            onClicked: {
                animation.start()
                if (button.checked) {
                    cycleAnimation.start()
                } else {
                    cycleAnimation.stop()
                    smallRect.color = "red"
                }
            }
        }
    }

    Text {
        id: label
        text: qsTr("Hello Basics")
        anchors.top: button.bottom
        font.family: Constants.font.family
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter

        SequentialAnimation {
            id: animation

            ColorAnimation {
                id: colorAnimation1
                target: rectangle
                property: "color"
                to: "#2294c6"
                from: Constants.backgroundColor
            }

            ColorAnimation {
                id: colorAnimation2
                target: rectangle
                property: "color"
                to: Constants.backgroundColor
                from: "#2294c6"
            }
        }
    }

    Rectangle {
        id: smallRect
        width: 50
        height: 50
        color: "red"
        anchors.left: button.right
        anchors.verticalCenter: button.verticalCenter
        anchors.leftMargin: 10 // отступ слева
    }

    SequentialAnimation {
        id: cycleAnimation
        running: false
        loops: Animation.Infinite // бесконечное повторение

        ColorAnimation {
            target: smallRect
            property: "color"
            from: "green"
            to: "yellow"
            duration: 1000 // время в миллисекундах
        }

        ColorAnimation {
            target: smallRect
            property: "color"
            from: "yellow"
            to: "red"
            duration: 1000
        }

        ColorAnimation {
            target: smallRect
            property: "color"
            from: "red"
            to: "green"
            duration: 1000
        }
    }

    states: [
        State {
            name: "clicked"
            when: button.checked

            PropertyChanges {
                target: label
                text: qsTr("Button Checked")
            }
        }
    ]
}
