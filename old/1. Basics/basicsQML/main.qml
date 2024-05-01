import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

import QtQuick.Shapes 1.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: 100
        height: 100
        color: "red"
    }


    Rectangle {

        width: 100
        height: 100
        color: "blue"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Rectangle clicked")
            }
        }

        x: 150  // начальное положение по оси X
        y: 0  // начальное положение по оси Y
    }

    Column {
        spacing: 10  // расстояние между элементами
        x: 300
        y: 0

        Rectangle { width: 100; height: 50; color: "red" }
        Shape {
            id: circ1
            width: 100
            height: 50
//            anchors.centerIn: parent

            ShapePath {
                id: p1
                strokeWidth: 1
//                strokeColor: "red"
                fillGradient: LinearGradient {
                    x1: 0; y1: 0
                    x2: 100; y2: 50
                    GradientStop { position: 0; color: "blue" }
                    GradientStop { position: 0.2; color: "green" }
                    GradientStop { position: 0.4; color: "red" }
                    GradientStop { position: 0.6; color: "yellow" }
                    GradientStop { position: 1; color: "cyan" }
                }
                strokeStyle: ShapePath.SolidLine

                // Определяем контур круга
                property real r: 24
                startX: circ1.width / 2 - r
                startY: circ1.height / 2 - r
                PathArc {
                    x: circ1.width / 2 + p1.r
                    y: circ1.height / 2 + p1.r
                    radiusX: p1.r; radiusY: p1.r
                    useLargeArc: true
                }
                PathArc {
                    x: circ1.width / 2 - p1.r
                    y: circ1.height / 2 - p1.r
                    radiusX: p1.r; radiusY: p1.r
                    useLargeArc: true
                }
            }
        }

        Shape {
            width: 100
            height: 50
//            anchors.centerIn: parent
            ShapePath {
                strokeWidth: 0
                strokeColor: "red"
                fillGradient: LinearGradient {
                    x1: 20; y1: 20
                    x2: 180; y2: 130
                    GradientStop { position: 0; color: "blue" }
                    GradientStop { position: 0.1; color: "green" }
                    GradientStop { position: 0.3; color: "red" }
                    GradientStop { position: 0.7; color: "yellow" }
                    GradientStop { position: 1; color: "cyan" }
                }
                strokeStyle: ShapePath.SolidLine
//                dashPattern: [ 1, 4 ]
                startX: 0; startY: 0
                PathLine { x: 100; y: 50 }
                PathLine { x: 0; y: 50 }
                PathLine { x: 0; y: 0 }
            }
        }
    }

    Row {
        spacing: 10
        x: 0
        y: 150

        Rectangle { width: 50; height: 50; color: "red" }
        Rectangle { width: 50; height: 50; color: "green" }
        Rectangle { width: 50; height: 50; color: "blue" }
    }

    Grid {
        columns: 3  // количество столбцов
        spacing: 10 // расстояние между элементами
        x: 250
        y: 250

        Rectangle { width: 50; height: 50; color: "red" }
        Rectangle { width: 50; height: 50; color: "green" }
        Rectangle { width: 50; height: 50; color: "blue" }
        Rectangle { width: 50; height: 50; color: "yellow" }
        Rectangle { width: 50; height: 50; color: "orange" }
        Rectangle { width: 50; height: 50; color: "purple" }
    }
}
