import 'package:bmi_ultra/components/reUsableCard.dart';
import 'package:bmi_ultra/screens/input_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmi_result,
      required this.result_text,
      required this.interpretation,
      required this.genderIcon});

  final String bmi_result;
  final String result_text;
  final String interpretation;
  final Icon genderIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleStyle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    alignment: Alignment.topLeft,
                    child: genderIcon,
                  ),
                  Text(
                    result_text.toUpperCase(),
                    style: kResultIndicatorStyle,
                  ),
                  Text(
                    bmi_result,
                    style: kResultNumberStyle,
                  ),
                  Text(
                    interpretation,
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTab: () {
              Navigator.pop(context);
            },
            title: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
