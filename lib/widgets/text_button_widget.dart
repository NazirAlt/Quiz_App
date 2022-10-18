import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final Color buttonBgColor;
  final String buttonText;
  final Function button;

  const TextButtonWidget({
    Key key,
    this.buttonBgColor,
    this.buttonText,
    this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: TextButton(
          onPressed: button,
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonBgColor),
          ),
        ),
      ),
    );
  }
}
