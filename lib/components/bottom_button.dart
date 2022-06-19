import 'package:flutter/material.dart';
import 'package:bmi_ultra/constants.dart';

class BottomButton extends StatelessWidget {
  final onTab;
  final title;
  BottomButton({this.onTab, this.title});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.dark),
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          padding: EdgeInsets.only(bottom: 10.0),
          margin: const EdgeInsets.only(top: kContainersPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kContainersPadding),
              color: kBottomContainerColor),
          width: double.infinity,
          height: kBottomContainerHeight,
          child: Center(
            child: Text(
              title,
              style: kLargeButtonStyle,
            ),
          ),
        ),
      ),
    );
  }
}
