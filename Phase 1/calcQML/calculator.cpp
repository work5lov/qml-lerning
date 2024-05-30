#include "calculator.h"

Calculator::Calculator(QObject *parent) : QObject(parent), firstNumber(0) {}

QString Calculator::getCurrentInput() const {
    return currentInput;
}

void Calculator::setCurrentInput(const QString &value) {
    if (currentInput != value) {
        currentInput = value;
        emit currentInputChanged();
    }
}

void Calculator::setOperation(const QString &op) {
    if (!currentInput.isEmpty()) {
        firstNumber = currentInput.toDouble();
        currentInput.clear();
        operation = op;
        emit currentInputChanged();
    }
}

void Calculator::calculate() {
    if (!currentInput.isEmpty() && !operation.isEmpty()) {
        double secondNumber = currentInput.toDouble();
        double result = 0;
        if (operation == "+") {
            result = firstNumber + secondNumber;
        } else if (operation == "-") {
            result = firstNumber - secondNumber;
        } else if (operation == "*") {
            result = firstNumber * secondNumber;
        } else if (operation == "/") {
            if (secondNumber != 0) {
                result = firstNumber / secondNumber;
            } else {
                currentInput = "Error";
                emit currentInputChanged();
                return;
            }
        }
        currentInput = QString::number(result);
        operation.clear();
        emit currentInputChanged();
    }
}

void Calculator::clear() {
    currentInput.clear();
    firstNumber = 0;
    operation.clear();
    emit currentInputChanged();
}
