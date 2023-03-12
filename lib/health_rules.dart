import 'package:flutter/material.dart';
import 'package:imc_app/person.dart';

String validateHealthRulesFor(Person person) {
  String result = "";

  // Basic Formula
  var bmiResult = person.getWeight() / (person.getHeight() * 2);

  if (bmiResult <= 18.5) {
    var bmiInfo = "BMI: Below Normal";
    debugPrint(bmiInfo);
    result = bmiInfo;
    // -------- //
  } else if (bmiResult > 18.5 && bmiResult <= 24.9) {
    var bmiInfo = "BMI: Normal or Adequate";
    debugPrint(bmiInfo);
    result = bmiInfo;
    // -------- //
  } else if (bmiResult > 24.9 && bmiResult <= 29.9) {
    var bmiInfo = "BMI: Overweight";
    debugPrint(bmiInfo);
    result = bmiInfo;
    // -------- //
  } else if (bmiResult > 29.9 && bmiResult <= 34.9) {
    var bmiInfo = "BMI: Overweight: Level I";
    debugPrint(bmiInfo);
    result = bmiInfo;
    // -------- //
  } else if (bmiResult > 34.9 && bmiResult <= 39.9) {
    var bmiInfo = "BMI: Overweight: Level II";
    debugPrint(bmiInfo);
    result = bmiInfo;
    // -------- //
  } else {
    var bmiInfo = "BMI: Overweight: Level III";
    debugPrint(bmiInfo);
    result = bmiInfo;
    // -------- //
  }
  debugPrint("BMI Value: $bmiResult");
  return result;
}
