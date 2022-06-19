import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight, required this.genderIcon});
  final height;
  final weight;
  Icon genderIcon;

  dynamic _bmi;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'Underweight';
    }
  }

  Icon getGenderIcon() {
    return genderIcon;
  }

  String getIntepretetion() {
    if (_bmi >= 25) {
      return 'You have a higher than norma body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'you have a lowe than normal body weight. You can eat a bit more.';
    }
  }
}
