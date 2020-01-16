import 'dart:math';
import 'package:flutter/material.dart';
import 'package:text_changer/textControl.dart';
import 'customText.dart';

void main() => runApp(TextChangerApp());

class TextChangerApp extends StatefulWidget {
  @override
  _TextChangerAppState createState() => _TextChangerAppState();
}

class _TextChangerAppState extends State<TextChangerApp> {
  var textList = [
    'Oops, it changed!',
    'Hope nobody will read that...',
    'Changed again!',
    'IT\'S ALIVE!',
    'The text changed!',
    'Did it just changed?',
    'It keeps changing!',
    'Lorem ipsum dolor sit amet',
    'Vai Brasil!',
    'It changed, or not?'
  ];
  var currentText = 'This text might change...';

  void changeText() {
    var rand = new Random();
    setState(() {
      currentText = textList[rand.nextInt(textList.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The Mighty Text Changer 2000'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              CustomText(currentText),
              TextController(changeText)
            ],
          ),
        ),
      ),
    );
  }
}
