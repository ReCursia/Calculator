import 'package:flutter/material.dart';
import 'dart:async';

class DigitButton extends StatefulWidget {
  static double BUTTON_WIDTH = 65.0;
  static double BUTTON_HEIGHT = 65.0;
  final String label;
  final Function onTap;
  final EdgeInsets padding;
  DigitButton({this.label, this.onTap, this.padding});

  @override
  State<StatefulWidget> createState() {
    return DigitButtonState();
  }
}

class DigitButtonState extends State<DigitButton> {
  Color color;
  Color labelColor;
  @override
  void initState() {
    super.initState();
    color = Color.fromRGBO(213, 213, 213, 1);
    labelColor = Colors.black.withOpacity(0.66);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: GestureDetector(
          onPanEnd: (DragEndDetails det) {
            widget.onTap();
            Future.delayed(const Duration(milliseconds: 150), () {
              setState(() {
                color = Color.fromRGBO(213, 213, 213, 1);
                labelColor = Colors.black.withOpacity(0.66);
              });
            });
          },
          onPanStart: (DragStartDetails det) {
            setState(() {
              color = Color.fromRGBO(255, 117, 117, 1);
              labelColor = Colors.white;
            });
          },
          child: AnimatedContainer(
            child: Center(
                child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'Qanelas',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: labelColor,
              ),
            )),
            height: DigitButton.BUTTON_HEIGHT,
            width: DigitButton.BUTTON_WIDTH,
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          )),
    );
  }
}
