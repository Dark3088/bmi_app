import 'package:imc_app/person.dart';
import 'package:test/test.dart';

class PersonInfoTest {
  void main() {
    test('sets a persons name', () {
      var newPerson = Person("Diego", 170, 90);
      expect(newPerson.getName(), matches("Diego"));
    });
  }
}
