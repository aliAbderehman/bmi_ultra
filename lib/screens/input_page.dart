import 'dart:ui';

import 'package:bmi_ultra/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/reUsableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/iconContent.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi_ultra/calculator_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum Gender {
  male,
  female,
  other,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.other;

  int personHeight = 150;
  int personWeigh = 65;
  int personAge = 18;
  dynamic personGender;

  void newState(Gender newSelectedGender) {
    setState(() {
      selectedGender = newSelectedGender;
    });
  }

  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        timeBackPressed = DateTime.now();
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);

        if (isExitWarning) {
          final messege = 'Press back again to exit';
          Fluttertoast.showToast(msg: messege, fontSize: 18);

          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(kContainersPadding),
                      child: ReusableCard(
                        onPress: () {
                          personGender = const Icon(
                            FontAwesomeIcons.mars,
                            color: kMaleIconColor,
                            size: 40.0,
                          );
                          newState(Gender.male);
                        },
                        color: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: const IconContent(
                          gender_icon: FontAwesomeIcons.mars,
                          icon_text: 'MALE',
                          icon_color: kMaleIconColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(kContainersPadding),
                      child: ReusableCard(
                        onPress: () {
                          personGender = const Icon(
                            FontAwesomeIcons.venus,
                            color: kFemaleIconColor,
                            size: 40.0,
                          );
                          newState(Gender.female);
                        },
                        color: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: const IconContent(
                          icon_text: 'FEMALE',
                          icon_color: kFemaleIconColor,
                          gender_icon: FontAwesomeIcons.venus,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(kContainersPadding),
                child: ReusableCard(
                  // width: ,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: kLableStyle,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(personHeight.toString(), style: kNumberStyle),
                          const Text(
                            'cm',
                            style: kLableStyle,
                          ),
                        ],
                      ),
                      Slider(
                        value: personHeight.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        // divisions: 10,

                        onChanged: ((value) {
                          setState(() {
                            personHeight = value.toInt();
                          });
                        }),
                      ),
                    ],
                  ),
                  color: kActiveCardColor,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(kContainersPadding),
                      child: ReusableCard(
                        color: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: kLableStyle,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    personWeigh.toString(),
                                    style: kNumberStyle,
                                  ),
                                  const Text(
                                    'kg',
                                    style: kLableStyle,
                                  )
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'btn1',
                                  onPressed: () {
                                    setState(() {
                                      if (personWeigh < 1) {
                                        personWeigh = 0;
                                      } else {
                                        personWeigh--;
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Color(0xF1ffbd00),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  heroTag: 'btn2',
                                  onPressed: () {
                                    setState(() {
                                      personWeigh++;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Color(0xF1ffbd00),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(kContainersPadding),
                      child: ReusableCard(
                        color: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: kLableStyle,
                            ),
                            Text(
                              personAge.toString(),
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'btn3',
                                  onPressed: () {
                                    setState(() {
                                      if (personAge < 1) {
                                        personAge = 0;
                                      } else {
                                        personAge--;
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Color(0xF1ffbd00),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  heroTag: 'btn4',
                                  onPressed: () {
                                    setState(() {
                                      personAge++;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Color(0xF1ffbd00),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onTab: () {
                if (personGender == null) {
                  Alert(
                    context: context,
                    style: const AlertStyle(
                        // overlayColor: Color.fromARGB(22, 255, 193, 7),
                        backgroundColor: kActiveCardColor,
                        isCloseButton: false,
                        titleStyle: TextStyle(color: kFontColor),
                        descStyle: kLableStyle),
                    type: AlertType.info,
                    title: "GENDER ALERT",
                    desc:
                        "Please select your gender before proceeding to the next step.",
                    buttons: [
                      DialogButton(
                        color: kBottomContainerColor,
                        highlightColor: kInactiveCardColor,
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                        child: const Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ).show();
                } else {
                  CalculatorBrain cal = CalculatorBrain(
                      height: personHeight,
                      weight: personWeigh,
                      genderIcon: personGender);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmi_result: cal.calculateBmi(),
                                result_text: cal.getResult(),
                                interpretation: cal.getIntepretetion(),
                                genderIcon: cal.getGenderIcon(),
                              )));
                }
              },
              title: 'CALCULATE',
            )
          ],
        ),
      ),
    );
  }
}
