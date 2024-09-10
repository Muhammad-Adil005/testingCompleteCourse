import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing/login_screen.dart';

void main() {
  group('Login Screen', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'Should show home screen when user taps after entering email Id and password is valid',
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
      await tester.pumpAndSettle(Durations.extralong4);

      Finder welcomeText = find.byType(Text);

      expect(welcomeText, findsOneWidget);
    });

    testWidgets(
        'Should show Required Fields when user taps on login button without entering email Id and password',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginScreen(),
        ),
      );

      Finder loginBtn = find.byType(ElevatedButton);
      await tester.tap(loginBtn);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      Finder errorText = find.text("Required Field");

      expect(errorText, findsNWidgets(2));
    });
  });
}
