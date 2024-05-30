#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>

class Calculator : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString currentInput READ getCurrentInput WRITE setCurrentInput NOTIFY currentInputChanged)
public:
    explicit Calculator(QObject *parent = nullptr);

    Q_INVOKABLE void setOperation(const QString &op);
    Q_INVOKABLE void calculate();
    Q_INVOKABLE void clear();

    QString getCurrentInput() const;
    void setCurrentInput(const QString &value);

signals:
    void currentInputChanged();

private:
    QString currentInput;
    QString operation;
    double firstNumber;
};

#endif // CALCULATOR_H
