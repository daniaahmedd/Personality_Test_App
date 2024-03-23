import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import './quizpart.dart';
import 'dart:math';

class startQuiz extends StatefulWidget {
  startQuiz({super.key});

  @override
  State<startQuiz> createState() => _startQuizState();
}

class _startQuizState extends State<startQuiz> with SingleTickerProviderStateMixin{
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  Path drawcircularconfetti(Size size) {
  // Method to convert degree to radians
  double degToRad(double deg) => deg * (pi / 180.0);

  final numberOfSprays = 10;  // Number of firework trails
  final baseRadius = size.width / 4;  // Base radius of the firework
  final extent = size.width / 3;  // Distance the trails extend
  final path = Path();

  // Create a central circle for the firework's core
  path.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: baseRadius));

  // Generate random spray trails with varying angles and lengths
  for (int i = 0; i < numberOfSprays; i++) {
    final angle = degToRad(Random().nextDouble() * 360);
    final length = Random().nextDouble() * extent;
    final endPoint = Offset(
       (size.width / 2) + cos(angle) * length,
       (size.height / 2) + sin(angle) * length
    );
    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(endPoint.dx, endPoint.dy);
  }

  return path;
}

Path drawFireworks(Size size) {
  // Method to convert degree to radians
  double degToRad(double deg) => deg * (pi / 180.0);

  final numberOfBursts = 10; // Number of bursts in the firework
  final baseRadius = size.width / 10; // Base radius of the firework burst
  final extent = size.width / 3; // Distance the bursts extend
  final path = Path();

  // Generate random bursts with varying angles and lengths
  for (int i = 0; i < numberOfBursts; i++) {
    final angle = degToRad(Random().nextDouble() * 360);
    final length = baseRadius + Random().nextDouble() * extent;
    final endPoint = Offset(
      (size.width / 2) + cos(angle) * length,
      (size.height / 2) + sin(angle) * length,
    );

    final controlPoint1 = Offset(
      (size.width / 2) + cos(angle + degToRad(45)) * (length / 2),
      (size.height / 2) + sin(angle + degToRad(45)) * (length / 2),
    );

    final controlPoint2 = Offset(
      (size.width / 2) + cos(angle - degToRad(45)) * (length / 2),
      (size.height / 2) + sin(angle - degToRad(45)) * (length / 2),
    );

    path.moveTo(size.width / 2, size.height / 2);
    path.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );
  }

  return path;
}


  // late final FireworkController _controller = FireworkController(vsync: this)
  //   ..start()
  //   ..autoLaunchDuration = Duration.zero
  //   ..rocketSpawnTimeout = Duration.zero
  //   ..title = '';
  // final _random = Random();

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

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
      SafeArea(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              createParticlePath: drawcircularconfetti, // define a custom shape/path.
          ),
          ),
      Align(
        alignment: Alignment.center,
        child: (){
          _controllerCenter.play();
          // _controller.spawnRocket(
          // Point(
          //   _random.nextDouble() * _controller.windowSize.width,
          //   _random.nextDouble() * _controller.windowSize.height / 2,
          // ),
          // forceSpawn: true,
          //);
        }()
      ),
      Align(
        alignment: Alignment.center,
        child: Text('You\'re an' , style: TextStyle(fontSize: 15)),
      ),
      Align(
        alignment: Alignment.center,
        child: Padding(padding: EdgeInsets.only(top: 13), child: Text(introScore > extroScore && introScore > ambiScore? "Introvert": 
                  extroScore > introScore && extroScore > ambiScore? "Extrovert": 
                  ambiScore > introScore && ambiScore > extroScore? "Ambivert": "", style: TextStyle(fontSize: 30),),),
      ),
      Align(
        alignment: Alignment.center,
        child: Padding(padding: EdgeInsets.only(top: 53), child: ElevatedButton(style: style , onPressed: () {
        Navigator.pop(context);
      }, child: Text('Try Again!')))
      ),
    ]),
    ), 
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