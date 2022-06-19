// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  dynamic onPress;

  final cardChild;
  final color;
  final width;
  ReusableCard({this.cardChild, this.color, this.onPress, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: cardChild,
        // child: cardChild,
      ),
    );
  }
}
