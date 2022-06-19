import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';
import 'screens/result_page.dart';

const backgroundColor = Color(0xFF0A0E21);
void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData them = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: Colors.amber,
        colorScheme: them.colorScheme.copyWith(
          secondary: Color(0xFF212747),
          primary: backgroundColor,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(),
        sliderTheme: const SliderThemeData(
          thumbColor: kBottomContainerColor,
          trackHeight: 1.0,
          overlayColor: Color(0x1Fffbd00),
          activeTrackColor: kBottomContainerColor,
          inactiveTrackColor: kFontColor,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: kFontColor),
        ),
      ),
      initialRoute: '/',
      home: const InputPage(),
    );
  }
}
