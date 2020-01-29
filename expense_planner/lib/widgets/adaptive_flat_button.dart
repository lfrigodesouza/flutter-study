import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final Function onPressHandler;
  final String buttonText;

  AdaptiveFlatButton(this.buttonText, this.onPressHandler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              buttonText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: onPressHandler,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              buttonText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: onPressHandler,
          );
  }
}
