import 'package:imc_app/health_rules.dart';
import 'package:imc_app/person.dart';
import 'package:test/test.dart';

void main() {
  test('sets a person\'s name', () {
    var newPerson = Person("Diego", 0, 0);
    expect(newPerson.getName(), matches("Diego"));
  });

  test('sets a person\'s height', () {
    var newPerson = Person("Fulano", 180, 0);
    expect(newPerson.getHeight(), 180);
  });

  test('sets a person\'s weight', () {
    var newPerson = Person("Natália", 0, 60);
    expect(newPerson.getWeight(), 60);
  });

  group('Health Rules', () {
    test('Determines that a person\'s body mass index is below normal', () {
      var individual = Person("Roberto", 1.90, 40);

      // Check for the person's body mass index
      var bodyMassResult = validateHealthRulesFor(individual);

      expect(bodyMassResult, matches("BMI: Below Normal"));
    });

    test('Determines that a person\'s body mass index is normal or adequate',
        () {
      var individual = Person("Kamila", 1.60, 70);
      var bodyMassResult = validateHealthRulesFor(individual);

      expect(bodyMassResult, matches("BMI: Normal or Adequate"));
    });

    test('Determines that a person\'s body mass index is overweight', () {
      var individual = Person("Kevin", 1.60, 90);
      var bodyMassResult = validateHealthRulesFor(individual);

      expect(bodyMassResult, matches("BMI: Overweight"));
    });

    test('Determines that a person\'s body mass index is overweight level I',
        () {
      var individual = Person("Júlio", 1.50, 100);
      var bodyMassResult = validateHealthRulesFor(individual);

      expect(bodyMassResult, matches("BMI: Overweight: Level I"));
    });

    test('Determines that a person\'s body mass index is overweight level II',
        () {
      var individual = Person("Aline", 1.70, 120);
      var bodyMassResult = validateHealthRulesFor(individual);

      expect(bodyMassResult, matches("BMI: Overweight: Level II"));
    });

    test('Determines that a person\'s body mass index is overweight level III',
        () {
      var individual = Person("Daniel", 1.64, 140);
      var bodyMassResult = validateHealthRulesFor(individual);

      expect(bodyMassResult, matches("BMI: Overweight: Level III"));
    });
  });
}
