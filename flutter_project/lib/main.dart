import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Green', 'Blue', 'Yellow', 'Red']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Dog', 'Cat', 'Rabbit', 'Birds']
    },
    {
      'questionText': 'What\'s your prefered vehicle?',
      'answers': ['Car', 'Motorcicle', 'Bicicle', 'Boat']
    },
    {
      'questionText': 'It\'s gonna rain today?',
      'answers': ['Yes', 'No']
    }
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    );
  }
}
