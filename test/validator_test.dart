import 'package:flutter_test/flutter_test.dart';
import 'package:testing/validator.dart';

void main() {
  test('Validate for empty email Id', () {
    // Arrange & Act
    var result = Validator.validateEmail('');

    // Assert
    expect(result, 'Required Field');
  });

  test('Validate for Invalid email Id', () {
    var result = Validator.validateEmail('amGheue;xiaueofalfjd');

    expect(result, 'please enter a valid email Id');
  });

  test('Validate for empty Password', () {
    var result = Validator.validatePassword('');

    expect(result, 'Required Field');
  });

  test('Validate for Invalid Password', () {
    var eightCharacter = Validator.validatePassword('1234');

    expect(eightCharacter, 'Password Should be at least 8 Character');
  });

  test('Validate for Valid Password', () {
    var eightCharacter = Validator.validatePassword('12345678');

    expect(eightCharacter, null);
  });
}
