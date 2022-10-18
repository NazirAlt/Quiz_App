import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    Key key,
    @required this.questionText,
  }) : super(key: key);

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Center(
        child: Text(
          questionText,
          style: TextStyle(fontSize: 32.0, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
