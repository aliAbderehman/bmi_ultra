import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final gender_icon;
  final icon_text;
  final icon_color;

  const IconContent({this.icon_text, this.gender_icon, this.icon_color});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        gender_icon,
        size: kIconSize,
        color: icon_color,
      ),
      const SizedBox(
        height: kSizedBoxHeight,
      ),
      Text(
        icon_text,
        style: kLableStyle,
      ),
    ]);
  }
}
