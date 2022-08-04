
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterupskilling/screens/biometric_auth.dart';
import 'package:flutterupskilling/screens/login.dart';
import 'package:flutterupskilling/screens/signup.dart';
import 'package:flutterupskilling/screens/homescreen.dart';
import 'package:flutterupskilling/widgets/inputs/textPassword.dart';
import 'package:flutterupskilling/widgets/inputs/textPrimary.dart';
import 'package:get/get.dart';



main() {


//signup textboxs - not testing whether signup onclick works or not, expect it to
// testWidgets('signup page text inputs test', (WidgetTester tester) async
// {
//   await tester.pumpWidget(GetMaterialApp(home: SignUpScreen(),));
//   await tester.pumpAndSettle();

// //find the widgets we want to test
// final usernameField = find.byKey(Key("signupUsername"));
// final emailField = find.byKey(Key("signupEmail"));
// final passwordField = find.byKey(Key("signupPassword"));

// //execute the test
// await tester.enterText(usernameField, 'Dimakatso');
// await tester.enterText(emailField, 'Dima@mail.com');
// await tester.enterText(passwordField, 'Password1!');
// await tester.pumpAndSettle();
// await tester.tap(find.byKey(Key("signupPageCreateAccount")));
// await tester.pumpAndSettle(); //setstate but for widget tests

// //check outputs
// expect(find.byType(LoginScreen), findsOneWidget);
// });

//login textboxes
  testWidgets('login page text inputs test', (WidgetTester tester) async
  {
    await tester.pumpWidget(const GetMaterialApp(home: LoginScreen(),));
    await tester.pumpAndSettle();

//find the widgets we want to test
    final emailField = find.byKey(const Key("loginEmail"));
    final passwordField = find.byKey(const Key("loginPassword"));

//execute the test
    await tester.enterText(emailField, 'Dima@mail.com');
    await tester.enterText(passwordField, ' ');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("loginPageSignIn")));
    await tester.pumpAndSettle(); //setstate but for widget tests

//check outputs
    expect(find.byType(homeScreen), findsOneWidget);
  });
  //};);
}
