import 'package:flutter/material.dart';
import 'package:flutter_project/question.dart';

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
  }

  var questions = [
    'What\'s your favorite color?',
    'What\'s your favorite animal?'
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('My First App'),
        ),
        body: Column(children: [
          Question(
            questions[_questionIndex],
          ),
          RaisedButton(
            child: Text('Answer 1'),
            onPressed: _answerQuestion,
          ),
          RaisedButton(
            child: Text('Answer 2'),
            onPressed: _answerQuestion,
          ),
          RaisedButton(
            child: Text('Answer 3'),
            onPressed: _answerQuestion,
          ),
        ]),
      ),
    );
  }
}
