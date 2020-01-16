import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String currentText;
  CustomText(this.currentText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        currentText,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
