import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // Кнопка
    Button {
        id: myButton
        text: "Нажми меня"
//        anchors {
//            left: parent.left
//            top: parent.top
//            margins: 10
//        }

    }

    SequentialAnimation on color {
       ColorAnimation { to: "red"; duration: 1000 }
       ColorAnimation { to: "yellow"; duration: 1000 }
       ColorAnimation { to: "green"; duration: 1000 }
       loops: Animation.Infinite
   }



//    MouseArea {
//        anchors.fill: myButton
//        onPressed: {
//            myButton.background.color = "red"
//            myButton.text = "Нажата!"
//        }
//        onReleased: {
//            myButton.background.color = "lightgray"
//            myButton.text = "Нажми меня"
//        }
//    }


    // Текстовое поле
    TextField {
        id:textField
        placeholderText: "Введите текст"
        anchors {
            left: parent.left
            top: myButton.bottom
            margins: 10
        }
        onTextChanged: {
            console.log("Текст:", text)
        }
    }

    // Список
    ComboBox {
        id: comboBox
        model: ["Вариант 1", "Вариант 2", "Вариант 3"]
        anchors {
            left: parent.left
            top: textField.bottom
            margins: 10
        }
        onCurrentTextChanged: {
            console.log("Выбрано:", comboBox.currentText)
        }
    }
}
