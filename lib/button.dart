import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonCallback;

  const button({required this.buttonText, required
  this.buttonCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      child: 
        ElevatedButton(
          onPressed: buttonCallback,
          child: Text(buttonText, style: TextStyle(
            color: Colors.white,
            fontSize: 16
          )),
          style: ButtonStyle(backgroundColor:
          MaterialStateProperty.all(Colors.blue)),
        ),

    );
  }
}