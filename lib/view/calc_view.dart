import 'package:calculator/widgets/action_button.dart';
import 'package:calculator/widgets/digit_button.dart';
import 'package:calculator/widgets/equal_button.dart';
import 'package:flutter/material.dart';
import 'package:calculator/presenter/calc_presenter.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CalcView extends StatefulWidget {
  final double BUTTON_WIDTH = 65.0;
  @override
  State<StatefulWidget> createState() {
    return CalcViewState();
  }
}

class CalcViewState extends State<CalcView> implements CalcContract {
  String currentValue = "";
  String previousValue = "";
  CalcPresenter _presenter;
  int index; //for action buttons
  List<ActionButton> actionButtons; //
  @override
  void updateState(String currentValue, String previousValue) {
    setState(() {
      this.currentValue = currentValue;
      this.previousValue = previousValue;
    });
  }

  CalcViewState() {
    _presenter = CalcPresenter(this);
  }
  @override
  void initState() {
    super.initState();
    index = -1;
    actionButtons = <ActionButton>[
      ActionButton(
        label: "÷",
        onTap: () => _presenter.onPressedButton(BUTTONS.DIVISION),
        isActive: false,
      ),
      ActionButton(
        label: "×",
        onTap: () => _presenter.onPressedButton(BUTTONS.MULTIPLICATION),
        isActive: false,
      ),
      ActionButton(
        label: "−",
        onTap: () => _presenter.onPressedButton(BUTTONS.SUBSTRUCTION),
        isActive: false,
      ),
      ActionButton(
        label: "+",
        onTap: () => _presenter.onPressedButton(BUTTONS.ADDITION),
        isActive: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 32.0, left: 32.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: AutoSizeText(
                previousValue,
                maxLines: 1,
                style: TextStyle(
                  fontFamily: 'Qanelas',
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: AutoSizeText(
                currentValue,
                maxLines: 1,
                style: TextStyle(
                  fontFamily: 'Qanelas',
                  fontWeight: FontWeight.w900,
                  fontSize: 80.0,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 57.0,
          ),
          FittedBox(
            child: _buttonsTable(),
          ),
        ],
      ),
    );
  }

  Widget _buttonsTable() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      DigitButton(
                        label: 'C',
                        onTap: () => _presenter.onPressedButton(BUTTONS.CLEAR),
                        padding:
                            EdgeInsets.only(bottom: 8.0, top: 8.0, right: 13.0),
                      ),
                      DigitButton(
                        label: '%',
                        onTap: () =>
                            _presenter.onPressedButton(BUTTONS.PERCENT),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 13.0),
                      ),
                      DigitButton(
                        label: "+/-",
                        onTap: () =>
                            _presenter.onPressedButton(BUTTONS.INVERSE),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 13.0),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DigitButton(
                        label: "7",
                        onTap: () => _presenter.onPressedButton(BUTTONS.SEVEN),
                        padding:
                            EdgeInsets.only(bottom: 8.0, top: 8.0, right: 13.0),
                      ),
                      DigitButton(
                        label: "8",
                        onTap: () => _presenter.onPressedButton(BUTTONS.EIGHT),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 13.0),
                      ),
                      DigitButton(
                        label: "9",
                        onTap: () => _presenter.onPressedButton(BUTTONS.NINE),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 13.0),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DigitButton(
                        label: "4",
                        onTap: () => _presenter.onPressedButton(BUTTONS.FOUR),
                        padding:
                            EdgeInsets.only(bottom: 8.0, top: 8.0, right: 13.0),
                      ),
                      DigitButton(
                        label: "5",
                        onTap: () => _presenter.onPressedButton(BUTTONS.FIVE),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 13.0),
                      ),
                      DigitButton(
                        label: "6",
                        onTap: () => _presenter.onPressedButton(BUTTONS.SIX),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 13.0),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DigitButton(
                        label: "1",
                        onTap: () => _presenter.onPressedButton(BUTTONS.ONE),
                        padding:
                            EdgeInsets.only(bottom: 8.0, top: 8.0, right: 13.0),
                      ),
                      DigitButton(
                        label: "2",
                        onTap: () => _presenter.onPressedButton(BUTTONS.TWO),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 13.0),
                      ),
                      DigitButton(
                        label: "3",
                        onTap: () => _presenter.onPressedButton(BUTTONS.THREE),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 13.0),
                      ),
                    ],
                  )
                ],
              ),
              _buildActionButtons(),
            ],
          ),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  DigitButton(
                    label: "0",
                    onTap: () => _presenter.onPressedButton(BUTTONS.ZERO),
                    padding:
                        EdgeInsets.only(bottom: 8.0, top: 8.0, right: 13.0),
                  ),
                  DigitButton(
                    label: ".",
                    onTap: () => _presenter.onPressedButton(BUTTONS.DOT),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 13.0),
                  ),
                  _buildEqualButton(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      margin: EdgeInsets.only(left: 13.0),
      height: widget.BUTTON_WIDTH * 4 + 48.0,
      width: widget.BUTTON_WIDTH,
      decoration: BoxDecoration(
        color: Color.fromRGBO(213, 213, 213, 1),
        borderRadius: BorderRadius.circular(500.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: actionButtons
            .asMap()
            .map((int key, ActionButton button) {
              return MapEntry(
                  key,
                  ActionButton(
                    label: button.label,
                    onTap: button.onTap,
                    isActive: index == key ? true : false,
                  ));
            })
            .values
            .toList(growable: false),
      ),
    );
  }

  Widget _buildEqualButton() {
    return Container(
      margin: const EdgeInsets.only(left: 13.0),
      child: EqualButton(
        height: widget.BUTTON_WIDTH,
        width: widget.BUTTON_WIDTH * 2 + 26,
        label: '=',
        onTap: () => _presenter.onPressedButton(BUTTONS.EQUAL),
      ),
    );
  }

  @override
  void updateIndex(int value) {
    setState(() {
      index = value;
    });
  }
}
