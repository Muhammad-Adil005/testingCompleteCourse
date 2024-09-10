import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/login_screen.dart';

void main() {
  // for widget testing we write a function called testWidgets
  testWidgets('Should have a title', (WidgetTester tester) async {
    // Render the UI from the given widget, so we used a function called pumpWidget

    // Arrange
    await tester.pumpWidget(
      MaterialApp(
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

  testWidgets('Should have one text-field to collect user email id ',
      (WidgetTester tester) async {
    // Render the UI from the given widget, so we used a function called pumpWidget

    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act
    Finder userNameTextfield = find.byKey(const ValueKey('email_id'));

    //Assert
    expect(userNameTextfield, findsOneWidget);
  });

  testWidgets('Should have one text-field to collect user password',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    Finder passwordTextField = find.byKey(const ValueKey('password'));

    expect(passwordTextField, findsOneWidget);
  });

  testWidgets('Should have one Login Button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    Finder loginButton = find.byType(ElevatedButton);

    expect(loginButton, findsOneWidget);
  });

  testWidgets(
      'Show Required fields error message if user email and password is empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    Finder login = find.byType(ElevatedButton);

    // To simulate Tap event we used

    await tester.tap(login);
    // This pumpAndSettle is important because when we tap on a button it can perform some animation some UI changes done so we have to wait for it
    await tester.pumpAndSettle();
    Finder errorText = find.text('Required Field');

    expect(errorText, findsNWidgets(2));
  });

  testWidgets('Should submit form when user email Id and password is valid',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    Finder userNameTextField = find.byKey(const ValueKey("email_id"));
    Finder userPasswordTextField = find.byKey(const ValueKey("password"));
    await tester.enterText(userNameTextField, 'adil@gmail.com');
    await tester.enterText(userPasswordTextField, '12345678');

    Finder loginBtn = find.byType(ElevatedButton);
    await tester.tap(loginBtn);
    await tester.pumpAndSettle();

    Finder errorText = find.text('Required Field');

    expect(errorText, findsNothing);
  });
}
