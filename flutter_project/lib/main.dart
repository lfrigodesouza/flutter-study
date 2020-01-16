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
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
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

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 10},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Red', 'score': 6}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 10},
        {'text': 'Rabbit', 'score': 4},
        {'text': 'Birds', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your prefered vehicle?',
      'answers': [
        {'text': 'Car', 'score': 10},
        {'text': 'Motorcicle', 'score': 3},
        {'text': 'Bicicle', 'score': 2},
        {'text': 'Boat', 'score': 0}
      ]
    },
    {
      'questionText': 'It\'s gonna rain today?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 1}
      ]
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
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
