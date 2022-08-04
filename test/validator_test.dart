import 'package:flutter_test/flutter_test.dart';
import 'package:flutterupskilling/screens/login.dart';
import 'package:flutterupskilling/screens/signup.dart';


void  main(){
  //login screen
  test('empty email returns error string', (){
     var result = EmailFieldValidator.validateEmail('');
     expect(result, 'Please enter a valid email');
   });

  test('non-empty email returns null', (){
    var result = EmailFieldValidator.validateEmail('Dima@mail.com');
    expect(result, null);
  });

  test('empty password returns error string', (){
    var result = PasswordFieldValidator.validatePassword('');
    expect(result, 'Enter a valid password');
  });

  test('non-empty password returns null', (){
    var result = PasswordFieldValidator.validatePassword('Qwerty@123');
    expect (result, null);
  });

  //sign up
  test('empty username returns error string', (){
    var result = NameFieldValidatorSign.validateName('');
    expect(result, 'Please enter a valid username');
  });

  test('non-empty username returns null', (){
    var result = NameFieldValidatorSign.validateName('Dimakatso');
    expect(result, 'Please enter a valid username');
  });

  test('empty email returns error string', (){
    var result = EmailFieldValidatorSign.validateEmail('');
    expect(result, 'Please enter a valid email');
  });

  test('non-empty email returns null', (){
    var result = EmailFieldValidatorSign.validateEmail('Dima@mail.com');
    expect(result, null);
  });

  test('empty password returns error string', (){
    var result = PasswordFieldValidatorSign.validatePassword('');
    expect(result, 'Password must be 10 characters long');
  });

  // test('non-empty password returns null', (){
  //   var result = PasswordFieldValidatorSign.validatePassword('Qwerty@123');
  //   expect (result, null);
  // });

}


