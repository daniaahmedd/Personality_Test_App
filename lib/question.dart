import 'package:flutter/material.dart';

class question extends StatelessWidget {
  final String questionText;

  const question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 23, color: Colors.red),
        textAlign: TextAlign.center,
      )
    );
  }
}