import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutterupskilling/widgets/inputs/textPassword.dart';
import 'package:flutterupskilling/widgets/inputs/textPrimary.dart';
import 'screens.dart';
import 'package:flutterupskilling/widgets/buttons/buttonPrimary.dart';
import 'package:flutterupskilling/widgets/buttons/buttonText.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'homescreen.dart';

class EmailFieldValidator {
  static validateEmail(String value){
    if(!validator.email(value)){
      print('sign up email validator');
      return 'Please enter a valid email';
    }
    print('sign up email null');
    return null;
  }
}
class PasswordFieldValidator{
  static validatePassword(String value){
    if(!validator.password(value)){
      print('sign up password validator');
      return 'Enter a valid password';
    }
    print('sign up password null');
    return null;
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, this.onSignedIn}) : super(key: key);
  final onSignedIn;
  static const String _title = 'Login screen';
  //final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),
        centerTitle: true,
        ),
        body: const FirstStatefulWidget(),
      ),
    );
  }
}

class FirstStatefulWidget extends StatefulWidget {
  const FirstStatefulWidget({Key? key}) : super(key: key);
  //final VoidCallback onSignedIn;

  @override
  State<FirstStatefulWidget> createState() => _FirstStatefulWidgetState();
}

class _FirstStatefulWidgetState extends State<FirstStatefulWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final box = GetStorage();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //padding: const EdgeInsets.all(10),
        body: Form(
            key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            const Text(
                  'Log In',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 30)),

            //this works to make screen look proper but I need to do that in a better way actually
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '',
                  //color: Colors.green,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20),
                )),

            Container(
              child: textPrimary(title: "Email", controller: emailController, icon: Icon(Icons.email),
                validator: (value){
                  if(!validator.email(value!)){
                    print('sign up email validator');
                    return 'Please enter a valid email';
                  }
                  print('sign up email null');
                  return null;
                },
                inputKey: Key("loginEmail"),
              ),
            ),
            Container(
              child: textPassword(title: "Password", controller: passwordController, icon: Icon(Icons.lock),
                validator: (value){
                passwordController.text = value!.trimLeft().trim();
                  if(!validator.password(value)){
                    print('sign up password validator');
                    return 'Enter a valid password';
                  }
                  print('sign up password null');
                  return null;
                },
                inputKey:  Key("loginPassword"),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: buttonText(Pressed: ()=>{}, btnText: 'Forgot Password?'),
            ),
            Container(

                child: buttonPrimary(title: "Sign In",onpress: ()=>{
                  onLogin()}, inputKey: Key("loginPageSignIn"),

                )
            ),
            Row(
              children: <Widget>[
                 buttonText(Pressed: ()=>{signUp()}, btnText: 'Create an account'),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )));

  }
  /*void onClick(){
    Get.to(homeScreen());
  }*/
  void signUp(){
    Get.to(SignUpScreen());
  }

  void onLogin(){
    // String email = emailController.text.trim();
    // String password = passwordController.text.trim();
    // if(_formKey.currentState!.validate()){
    //   if (email.isNotEmpty && password.isNotEmpty) {
    //     print('Successful');
    //     if(emailController.text == box.read('email') &&
    //     passwordController.text == box.read('password'))
        //Get.to(homeScreen());
          Get.to(() => homeScreen());
  //   }
  //   }
  // }
 // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
 // sharedPreferences.removes('Email');

}}







