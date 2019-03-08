import 'package:calculator/presenter/calc_presenter.dart';

enum ACTION {
  ADD,
  SUBSTRUCTION,
  DIVISION,
  MULTIPLICATION,
  NONE,
}

class CalcData {
  String _previousValue;
  String _currentValue;
  ACTION action; //If perfoming add,substruction etc actions
  CalcData() {
    _previousValue = _currentValue = "";
    this.action = ACTION.NONE;
  }

  String get previousValue {
    if (_previousValue.endsWith(".0") && (action == ACTION.NONE)) {
      return _previousValue.replaceAll(".0", "");
    }
    return _previousValue;
  }

  String get currentValue {
    if (_currentValue.endsWith(".0") && (action == ACTION.NONE)) {
      return _currentValue.replaceAll(".0", "");
    }
    return _currentValue;
  }

  void setAction(ACTION value) {
    if (value == action &&
        _previousValue.isNotEmpty &&
        _currentValue.isNotEmpty) {
      equal();
      setAction(value);
    }
    if (_currentValue.isEmpty && (value == ACTION.SUBSTRUCTION)) {
      _currentValue = "-";
    } else if (action == ACTION.NONE &&
        _currentValue.isNotEmpty &&
        _currentValue != "-") {
      this.action = value;
      _previousValue = _currentValue;
      _currentValue = "";
    } else if (_currentValue.isNotEmpty && _currentValue != "-") {
      this.action = value;
    }
  }

  //TODO no .0 but when its typing it does
  ACTION get getAction => action;

  void equal() {
    switch (action) {
      case ACTION.ADD:
        _currentValue =
            (double.parse(_previousValue) + double.parse(_currentValue))
                .toString();
        break;
      case ACTION.SUBSTRUCTION:
        _currentValue =
            (double.parse(_previousValue) - double.parse(_currentValue))
                .toString();
        break;
      case ACTION.DIVISION:
        _currentValue =
            (double.parse(_previousValue) / double.parse(_currentValue))
                .toString();
        break;
      case ACTION.MULTIPLICATION:
        _currentValue =
            (double.parse(_previousValue) * double.parse(_currentValue))
                .toString();
        break;
      case ACTION.NONE:
        break;
    }
    action = ACTION.NONE;
    _previousValue = "";
  }

  void dot() {
    if (!_currentValue.contains('.') && _currentValue.isNotEmpty)
      _currentValue += '.';
  }

  void concDigit(BUTTONS value) {
    _currentValue += "${value.index}";
  }

  void clear() {
    _previousValue = _currentValue = "";
    action = ACTION.NONE;
  }

  void percent() {
    _currentValue = (double.parse(_currentValue) / 100).toString();
  }

  void inverse() {
    _currentValue = _currentValue.contains('-')
        ? _currentValue.replaceFirst('-', '')
        : '-' + _currentValue;
  }
}
