# testing

A new Flutter project.

## All About Testing, The Whole Course explanation


When You Write/Create a flutter application for mobile, Web, or Desktop it certain point it becomes very Huge to manage.

So how you handle this?

So its very difficult to manully test each and every aspect of that codebased. so that's why Flutter testing come. only relying on
manuall test.

The more test you write the more stronge, robust and bug free your code becomes.

its not possible to error free our code 100% because we are human and we can do the mistake, so manuall testing is important but the
Automated testing helps us to write clean and error free code.

WHY WRITE TEST?

1)I am paid to write code not test?
2) I have tight deadlines? I do not time to write test cases, i have to write the main functionality.
3) We already have testers, why do we need to write test?

Answers

1) A good programmer writes a clean and testable code which is not possible without writing test.
2) Once you learn how to write test, it makes development moves faster. because you are more confident in your test cases, and you are more confident that you covered all the edge cases.
3) Testers don't know the code better then developers, you can safeguard your code from any edge cases.

So Writing test cases, Safeguarding your whole code.

Clean Code == Testable Code.

So without write a test cases you won't be able to write clean code.

Test cases is your Bullet Proof Jacket for your code.


> TESTING PYRAMID

1) Unit testing :> Unit testing come on top. unit testing means testing a unit of your program like testing a function, testing a method, testing a class.
2) Widget testing :> each and everything in flutter is widget, so if you want to error free your widgets then you write a widget test for your widgets.
3) Integration testing :> Covers the large part of your application, testing the flow of your app.


> TESTING STRUCTURE (AAA)
Arrange
Act
Assert


Arrange
var a = 10;
var b = 10;

Act
var sum = Math().add(a, b);

Assert
expect(sum, 20);


expect function check whether the result come from our function is same is expected value.



> TDD (Test-Driven Development Life Cycle)

                    Write a 
                  failing test
                *             **
              *                *
              *
                                *
            Refactor             Make the 
                                 test pass
               *                *
                *             * 
                  * * * * * *      



If client comes and say that they need a hospital mangement system app, then you will start work towards the functionality.

But in TDD we know the functionality but instead of writing the functionality write away, first we write the
test for it. So we write the faling test first, then we make the test pass and then we Refactor the code.


in TDD we write the test first instead of writing the functionality.


1) UNIT TESTING

Testing a Unit of Code.
Exa:  Function, Class

> Rules of Unit Testing

1) Tests Should be independent
2) There should not be any implementation logic in unit test
3) Test should be simple, fast, clean & readable


> How to Write Unit Test?

1) File name must end with _test
2) Exa: if testing a validator.dart file then test file name must be validator_test.dart


> To Write Actual Unit Test

void main(){

test("Write complete description of the test", (){

     // ARRANGE


     //ACT


     // ASSERT

});
}




Exa: Create a file called maths_utils.dart in your project and pasted this code inside this file

int add(int a, int b) {
return a + b;
}


then inside test folder create a file called maths_utils_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:testing/maths_utils.dart';

void main() {
test('Check the two numbers addition function', () {
//Arrange
var a = 10;
var b = 20;

    //Act

    var sum = add(a, b);

    //Assert
    expect(sum, 30);
});
}


> Challenge Write the unit test for Sub, Mul, and Div

void main() {
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
}




> Grouping of unit test

All test which belongs to same group then we can group it like for exa the above function belongs to maths library so we can group it

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



> Unit test for email validation


inside lib create a file called Validator.dart


class Validator {
static String? validateEmail(String email) {
if (email.isEmpty) {
return 'Required Field';
}

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return 'please enter a valid email Id';
    }
    return null;
}

static String? validatePassword(String password) {
if (password.isEmpty) {
return 'Required Field';
}

    if (password.length < 8) {
      return 'Password Should be at least 8 Character';
    }
    return null;
}
}



inside test create a file called validator_test.dart

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




> WIDGET TESTING

In Flutter each and everything is widget, so lets write test for widgets as well.

> Rules of Widget testing is same is just like for Unit Testing


> Write Widget Test

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/login_screen.dart';

void main() {
// for widget testing we write a function called testWidgets
testWidgets('Should have a title', (WidgetTester tester) async {
// Render the UI from the given widget, so we used a function called pumpWidget

    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act
    // we want to get the title of the login page

    Finder title = find.text(
        'Login Screen'); // The best way and most recommended way is find.byKey();

    //Assert

    expect(title, findsOneWidget);
});
}


inside login_screen.dart

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
const LoginScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
centerTitle: true,
title: const Text('Login Screen'),
),
);
}
}




> Validation Error Case




> INTEGRATION TESTING


Integration testing is very important because its test the complete flow of the app.

> How to Write an integration test?

1) inside pubspec.yaml file include this package : integration_test below dev dependencies

   dev_dependencies:
   integration_test:
   sdk: flutter
   flutter_test:
   sdk: flutter


2) just add one more line to an integration test


void main(){

group('Login Screen', (){

    IntegrationTestWidgetsFlutterBinding.ensureinitialized();
    

    testWidgets('Should submit form when valid', (WidgetTester tester) async{

     // Arrange

    // Act

// Assert

}
}
}


3) For Integration testing you will create another folder inside your project not included inside test folder



> What will be the main Drawback of the Integration test?

The main drawback of the integration test is that when you run the integration test it will run the whole application so you have to wait for long time.












































































































 



