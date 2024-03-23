import 'package:flutter/material.dart';
import './quizpart.dart';

class startQuiz extends StatefulWidget {
  startQuiz({super.key});

  @override
  State<startQuiz> createState() => _startQuizState();
}

class _startQuizState extends State<startQuiz> {
  var extroScore = 0;
  var introScore = 0;
  var ambiScore = 0;

    var qIndex = 0;

  var qList = [
    {'q': 'How do you typically recharge after a long day or week?',
    'a': [
      {'cname': 'Spending time with friends or attending social events', 'score': 'B'},
      {'cname': 'Engaging in a solitary hobby or activity', 'score': 'C'},
      {'cname': 'Relaxing at home while enjoying a book or movie', 'score': 'A'}
    ]
    },
    {
    'q': 'How do you feel about being the centre of attention?',
    'a': [
      {'cname': 'Enjoy it and find it energizing', 'score': 'B'},
      {'cname': 'Tolerate it but feel uncomfortable or self-conscious', 'score': 'C'},
      {'cname': 'Dislike it and actively avoid being the centre of attention', 'score': 'A'}
    ]
    },
    {
      'q': 'How do you typically handle conflict or difficult conversations?',
      'a': [
        {'cname': 'Addressing it head-on and seeking to resolve the issue quickly', 'score': 'B'},
        {'cname': 'Avoiding it and hoping the issue resolves on its own', 'score': 'A'}, 
        {'cname': 'Reflecting on the issue alone before addressing it', 'score': 'C'}
      ]
    },
    {
    'q': 'Which of the following do you prefer in terms of communication',
    'a': [
      {'cname': 'Face-to-face conversations', 'score': 'B'},
      {'cname': 'Phone or video calls', 'score': 'C'},
      {'cname': 'Text or email', 'score': 'A'}
    ]
    },
    {
    'q': 'When making plans with friends or family, do you:',
    'a': [
      {'cname': 'Enjoy planning and organizing social events', 'score': 'B'},
      {'cname': 'Prefer when someone else takes charge of planning', 'score': 'C'},
      {'cname': 'Avoid making plans altogether', 'score': 'A'}
    ]
    },
    {
    'q': 'Which type of environment do you prefer in terms of work or study?',
    'a': [
      {'cname': 'A busy, social environment', 'score': 'B'},
      {'cname': 'A quiet, focused environment', 'score': 'A'},
      {'cname': 'A mix of both', 'score': 'C'}
    ]
    },
    {
    'q': 'Do you prefer to have a few close friends or a large network of acquaintances?',
    'a': [
      {'cname': 'A few close friends', 'score': 'A'},
      {'cname': 'A large network of acquaintances', 'score': 'B'},
      {'cname': 'Somewhere in between', 'score': 'C'}
    ]
    },
    {
    'q': 'When you are feeling stressed, what do you prefer to do?',
    'a': [
      {'cname': 'Talk to someone about it', 'score': 'B'},
      {'cname': 'Spend time alone to think', 'score': 'A'},
      {'cname': 'It depends on the situation', 'score': 'C'}
    ]
    },
    {
    'q': 'When working on a project, what do you prefer?',
    'a': [
      {'cname': 'Collaborating with others', 'score': 'B'},
      {'cname': 'Working independently', 'score': 'A'},
      {'cname': 'A mix of both', 'score': 'C'}
    ]
    },
    {
    'q': 'Which of the following do you prefer in a workplace?',
    'a': [
      {'cname': 'Open plan office with lots of interaction', 'score': 'B'},
      {'cname': 'Private office or cubicle', 'score': 'A'},
      {'cname': 'A mix of both', 'score': 'C'}
    ]
    },
  ];
  var resList = [
    {
      'A': 'Introvert',
      'B': 'Extrovert',
      'C': 'Ambivert'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 19));
    return Scaffold(
    appBar: AppBar(title: Text('Personality test'), backgroundColor:Colors.amber),
    body: qIndex < qList.length?

    quizpart(qList: qList, qIndex: qIndex, cbFunction: doSomething)

    : Center(child: 
    Padding(
    padding: EdgeInsets.all(220.0),
    child: Column(children: [
      Text('You\'re an' , style: TextStyle(fontSize: 15)),
      Text(introScore > extroScore && introScore > ambiScore? "Introvert": 
                  extroScore > introScore && extroScore > ambiScore? "Extrovert": 
                  ambiScore > introScore && ambiScore > extroScore? "Ambivert": "", style: TextStyle(fontSize: 30),),
      Padding(padding: EdgeInsets.only(top: 13), child: ElevatedButton(style: style , onPressed: () {
        Navigator.pop(context);
      }, child: Text('Try Again!'))) 
    ],)
    ),             
    )
    
    
  );
  }
    void doSomething(String score){
    switch(score){
      case "A": introScore += 1; break;
      case "B": extroScore += 1; break;
      case "C": ambiScore += 1; break;
    }
    setState(() {
      qIndex++;
    });
  }
}