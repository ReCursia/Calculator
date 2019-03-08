import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final bool isActive;
  ActionButton({this.label, this.onTap, this.isActive});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: 65.0,
        height: 65.0,
        decoration: BoxDecoration(
          color:
              isActive ? Color.fromRGBO(255, 117, 117, 1) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Qanelas',
              fontSize: 28.0,
              color: isActive ? Colors.white : Colors.black.withOpacity(0.66),
            ),
          ),
        ),
      ),
    );
  }
}
