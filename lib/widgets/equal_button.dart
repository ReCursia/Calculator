import 'package:flutter/material.dart';

class EqualButton extends StatelessWidget {
  final double height;
  final double width;
  final String label;
  final Function onTap;
  EqualButton({this.label, this.onTap, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35.0),
      child: Container(
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: Center(
                child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Qanelas',
                fontSize: 30.0,
                color: Colors.white,
              ),
            )),
          ),
        ),
        height: height,
        width: width,
        color: const Color.fromRGBO(255, 117, 117, 1),
      ),
    );
  }
}
