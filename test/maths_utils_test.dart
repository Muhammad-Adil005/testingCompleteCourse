import 'package:flutter_test/flutter_test.dart';
import 'package:testing/maths_utils.dart';

void main() {
  group('Maths Group ->', () {
    test('Check the two numbers addition function', () {
      //Arrange
      var a = 10;
      var b = 20;

      //Act

      var sum = add(a, b);

      //Assert
      expect(sum, 30);
    });

    test('Check the two numbers multiplication function', () {
      // ARRANGE

      var a = 50;
      var b = 5;

      // ACT

      var mul = multiply(a, b);

      //ASSERT
      expect(mul, 250);
    });

    test('Check the two numbers subtraction function', () {
      int a = 100;
      int b = 50;

      var subtraction = sub(a, b);

      expect(subtraction, 50);
    });
  });
}
