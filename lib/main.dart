import 'package:flutter/material.dart';
import './question.dart';
import './button.dart';
import './quizpart.dart';
import 'startQuiz.dart';

void main(){
runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 19), backgroundColor: Colors.amber);
  return MaterialApp(
    home: Builder(
    builder: (context) => Scaffold(
    appBar: AppBar(title: Text('Personality test'), backgroundColor:Colors.amber),
    body: 
    Column(children: [
    Padding(
    padding: EdgeInsets.all(120.0),
    child: Center(child: 
    SizedBox(height: 50, width: 200, child: ElevatedButton(style: style , onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => startQuiz()),
      );}, child: Text('Start', style: TextStyle(
            color: Colors.black,
          ),)),
    ),
    ),
    ),
    ],)
    
  ),
  ),
  );
  }
}
