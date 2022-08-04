import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/buttons/buttonPrimary.dart';
import 'biometric_auth.dart';
import 'login.dart';
import 'package:slide_to_act/slide_to_act.dart';

class homeScreen extends StatelessWidget{
  final box = GetStorage();

  var context;
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard',
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    '${box.read('Username')}',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              /*Container(
                child: ElevatedButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Use face/fingerprint'),
                      content: const Text('Would you like to use your face/fingerprint to login and logout?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Get.to(LoginScreen()),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Get.to(biometricAuth()),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ), child: const Text('Log out'),

              )),*/
            Container(
              child: SlideAction(
                borderRadius: 12,
                elevation: 0,
                text: 'Slide to Logout',
                //sliderButtonIcon: const Icon(Icons.),
                onSubmit: (){
                  //show the dialog box
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Use face/fingerprint'),
                      content: const Text('Would you like to use your face/fingerprint to login and logout?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Get.to(LoginScreen()),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Get.to(biometricAuth()),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },

              ),
            )],
          ),
        ));
  }

/*Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Face/Fingerprint login'),
        content: Text('Would you like to set up fingerprint/face login?'),
        actions: [
          TextButton(
              onPressed: (){},
              child: Text('Would you like to set up fingerprint/face login?'))
        ],
      ));*/

}