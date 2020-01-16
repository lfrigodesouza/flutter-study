import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _resultScore;
  final Function resetHandler;

  Result(this._resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (_resultScore <= 10) {
      resultText = 'You are awesome!';
    } else if (_resultScore <= 25) {
      resultText = 'You are OK...';
    } else {
      resultText = 'You are on the dark side';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            'Your score was $_resultScore',
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 100,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            color: Colors.red,
            textColor: Colors.white,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
