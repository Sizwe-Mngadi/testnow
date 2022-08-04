import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/inputs/textPrimary.dart';
import '../widgets/inputs/textPassword.dart';
import 'screens.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/buttons/buttonPrimary.dart';
import 'login.dart';
import 'package:form_validator/form_validator.dart';
import 'package:regexed_validator/regexed_validator.dart';

class NameFieldValidatorSign{
  static validateName(String value){
  if(!validator.name(value)){
    print('sign up username validator');
    return 'Please enter a valid username';
  }
    print('sign up username null');
    return null;

}
}

class EmailFieldValidatorSign{
  static validateEmail(String value){
    if(!validator.email(value)){
      print('sign up email validator');
      return 'Please enter a valid email';
    }
    print('sign up email null');
    return null;
  }
}
class PasswordFieldValidatorSign{
  static validatePassword(String value) {
    //passwordController.text = value!.trimLeft().trim();
    if(!validator.password(value)){
      value.trimLeft();
      print('sign up password validator');
      return 'Password must be 10 characters long';
    }
    print('sign up password null');
    return null;
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Screen'),
        centerTitle: true,
      ),
      body: const SecondStatefulWidget(),
    );
  }
}

class SecondStatefulWidget extends StatefulWidget {
  const SecondStatefulWidget({Key? key}) : super(key: key);

  @override
  State<SecondStatefulWidget> createState() => _SecondStatefulWidgetState();
}

class _SecondStatefulWidgetState extends State<SecondStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final box = GetStorage();
  final _formKey = GlobalKey<FormState>();
  void _validate() {
    //_form.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
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
            //users username textbox
            Container(
              child: textPrimary(title: "Username", controller: nameController, icon: Icon(Icons.person), inputKey: Key("signupName"),
                validator: (value){
                  if(validator.name(value!)){
                    print('sign up username validator');
                    return 'Please enter a valid username';
                  }
                  print('sign up username null');
                  return null;
                },
              ),
            ),

            //Users cellphone number textbox
            Container(
              child: textPrimary(title: "Mobile Number", controller: phoneController, icon: Icon(Icons.phone), inputKey: Key("signupPhoneNumber"),
              validator: (value){
                  if(!validator.phone(value!)){
                  print('sign up cell number validator');
                  return 'Mobile number must be of 10 digits';
                  }
                  print('sign up mobile number null');
                  return null;
              },
              ),
            ),

            //email address of user
            Container(
              child: textPrimary(title: "Email", controller: emailController, icon: Icon(Icons.email), inputKey: Key("signupEmail"),
                validator: (value){
                  if(!validator.email(value!)){
                    print('sign up email validator');
                    return 'Please enter a valid email';
                  }
                  print('sign up email null');
                  return null;
                },
              ),
            ),
            Container(
              child: textPassword(title: "Password", controller: passwordController, icon: Icon(Icons.lock), inputKey: Key("signupPassword"),
                  validator: (value){
                    passwordController.text = value!.trimLeft().trim();
                  if(!validator.password(value)){
                    value.trimLeft();
                  print('sign up password validator');
                  return 'Password must be 10 characters long';
                  }
                  print('sign up password null');
                  return null;
                  },
              ),
            ),
            Container(
                child:buttonPrimary(title: "Sign up",onpress: ()=>
                {
                onSubmit(),
                }, inputKey: Key("signupPageCreateAccount"),)),
          ],
        ))

    );


  }

  void onSubmit(){

    String username = nameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (username != '' && email != '' && password != '' && phone != '') {
        print('Successful');
        box.write('Username', username);
        box.write('Phone', phone);
        box.write('Email', email);
        box.write('Password', password);

        print(box.read("Username"));
        print(box.read("Phone"));
        print(box.read("Email"));
        print(box.read("Password"));
        Get.to(LoginScreen());
    }else{
      if(_formKey.currentState!.validate()){
        if (username != '' && email != '' && password != '' && phone != '') {
          print('Successful');
          box.write('Username',username );
          box.write('Phone',phone);
          box.write('Email', email);
          box.write('Password', password);
          Get.to(LoginScreen());
        }
      }
    }
  }
}
//|| value != 10 || value != "0"+value.toString())
// && phone.length != 10