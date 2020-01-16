import 'package:flutter/material.dart';

class TextController extends StatelessWidget {
  final Function changeHandler;
  TextController(this.changeHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Press Me'),
        onPressed: changeHandler,
      ),
    );
  }
}
