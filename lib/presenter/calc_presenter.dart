import 'package:calculator/model/calc_data.dart';

enum BUTTONS {
  ZERO,
  ONE,
  TWO,
  THREE,
  FOUR,
  FIVE,
  SIX,
  SEVEN,
  EIGHT,
  NINE,
  ADDITION,
  SUBSTRUCTION,
  MULTIPLICATION,
  DIVISION,
  EQUAL,
  DOT,
  CLEAR,
  PERCENT,
  INVERSE,
}

abstract class CalcContract {
  void updateState(String currentValue, String previousValue);
  void updateIndex(int index);
}

class CalcPresenter {
  CalcContract _view;
  CalcData _calcData;

  CalcPresenter(this._view) {
    _calcData = CalcData();
  }
  String _getAction() {
    ACTION value = _calcData.getAction;
    switch (value) {
      case ACTION.ADD:
        return "+";
      case ACTION.SUBSTRUCTION:
        return "−";
      case ACTION.MULTIPLICATION:
        return "×";
      case ACTION.DIVISION:
        return "÷";
      default:
        return "";
    }
  }

  void onPressedButton(BUTTONS value) {
    switch (value) {
      case BUTTONS.ADDITION:
        _calcData.setAction(ACTION.ADD);
        break;
      case BUTTONS.SUBSTRUCTION:
        _calcData.setAction(ACTION.SUBSTRUCTION);
        break;
      case BUTTONS.MULTIPLICATION:
        _calcData.setAction(ACTION.MULTIPLICATION);
        break;
      case BUTTONS.DIVISION:
        _calcData.setAction(ACTION.DIVISION);
        break;
      case BUTTONS.EQUAL:
        _calcData.equal();
        break;
      case BUTTONS.DOT:
        _calcData.dot();
        break;
      case BUTTONS.CLEAR:
        _calcData.clear();
        break;
      case BUTTONS.PERCENT:
        _calcData.percent();
        break;
      case BUTTONS.INVERSE:
        _calcData.inverse();
        break;
      default:
        _calcData.concDigit(value);
        break;
    }
    updateState();
    updateActionButtons();
  }

  //Updating current and previous values
  void updateState() {
    _view.updateState(
        _calcData.currentValue,
        _calcData.previousValue.isNotEmpty
            ? _calcData.previousValue + _getAction() + _calcData.currentValue
            : "");
  }

  //Updating action buttons
  void updateActionButtons() {
    switch (_calcData.getAction) {
      case ACTION.DIVISION:
        _view.updateIndex(0);
        break;
      case ACTION.MULTIPLICATION:
        _view.updateIndex(1);
        break;
      case ACTION.SUBSTRUCTION:
        _view.updateIndex(2);
        break;
      case ACTION.NONE:
        _view.updateIndex(-1);
        break;
      case ACTION.ADD:
        _view.updateIndex(3);
        break;
    }
  }
}
