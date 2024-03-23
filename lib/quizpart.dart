import 'package:flutter/material.dart';
import './question.dart';
import './button.dart';

class quizpart extends StatelessWidget {
  final Function cbFunction;
  final int qIndex;
  final List<Map<String, Object>> qList;

  quizpart({required this.qList, required this.qIndex, required
  this.cbFunction});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      question(qList[qIndex]['q'] as String),
      ...(qList[qIndex]['a'] as List<Map<String,Object>>).map((result) {
        return button(buttonText: result['cname'] as String, buttonCallback: () => cbFunction(result['score']));
      }).toList()
    ]);
  }
}