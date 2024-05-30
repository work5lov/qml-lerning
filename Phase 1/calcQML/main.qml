import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 300
    height: 400
    title: "Calculator"

    Rectangle {
        color: "lightgrey"
        height: 50
        radius: 5
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }

        Text {
            id: display
            text: "0"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
        Layout.fillWidth: true; Layout.fillHeight: true
    }

    GridLayout {
        id: grid
        columns: 4
        anchors.fill: parent
        rowSpacing: 10
        columnSpacing: 10

        // Repeater {
        //     model: grid.children.length
        //     delegate: Item {
        //         Layout.fillWidth: true
        //         Layout.fillHeight: true
        //     }
        // }

        Button { text: "7"; Layout.column: 0; Layout.row: 0; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "8"; Layout.column: 1; Layout.row: 0; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "9"; Layout.column: 2; Layout.row: 0; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "/"; Layout.column: 3; Layout.row: 0; Layout.fillWidth: true; Layout.fillHeight: true }

        Button { text: "4"; Layout.column: 0; Layout.row: 1; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "5"; Layout.column: 1; Layout.row: 1; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "6"; Layout.column: 2; Layout.row: 1; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "*"; Layout.column: 3; Layout.row: 1; Layout.fillWidth: true; Layout.fillHeight: true }

        Button { text: "1"; Layout.column: 0; Layout.row: 2; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "2"; Layout.column: 1; Layout.row: 2; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "3"; Layout.column: 2; Layout.row: 2; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "-"; Layout.column: 3; Layout.row: 2; Layout.fillWidth: true; Layout.fillHeight: true }

        Button { text: "0"; Layout.column: 0; Layout.row: 3; Layout.columnSpan: 2; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "."; Layout.column: 2; Layout.row: 3; Layout.fillWidth: true; Layout.fillHeight: true }
        Button { text: "+"; Layout.column: 3; Layout.row: 3; Layout.fillWidth: true; Layout.fillHeight: true }

        Button {
            text: "C"
            Layout.column: 0; Layout.row: 4
            Layout.columnSpan: 4
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
