import 'package:imc_app/person.dart';

String validateHealthRulesFor(Person person) {
  String result = "";

  // Basic Formula
  var imcResult = person.getWeight() / (person.getHeight() * 2);

  if (imcResult <= 18.5) {
    // Below normal
    result = "IMC: Below Normal";
  } else if (imcResult > 18.5 && imcResult <= 24.9) {
    // Normal or Adequate
    result = "IMC: Normal or Adequate";
  } else if (imcResult > 24.9 && imcResult <= 29.9) {
    // Overweight
    result = "IMC: Overweight";
  } else if (imcResult > 29.9 && imcResult <= 34.9) {
    // Overweight: Level I
    result = "IMC: Overweight: Level I";
  } else if (imcResult > 34.9 && imcResult <= 39.9) {
    // Overweight: Level II
    result = "IMC: Overweight: Level II";
  } else {
    // Overweight: Level III
    result = "IMC: Overweight: Level III";
  }
  return result;
}
