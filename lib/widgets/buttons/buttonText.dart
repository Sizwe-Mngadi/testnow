import 'package:flutter/material.dart';

class buttonText extends StatefulWidget {
  const buttonText({Key? key,required this.Pressed, required this.btnText, this.inputKey                                                                                        }) : super(key: key);
  final void Function() Pressed;
  final String btnText;
  final Key? inputKey;



  @override
  State<buttonText> createState() => _buttonTextState();
}

class _buttonTextState extends State<buttonText> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: TextButton(
        key: widget.inputKey,
        child: Text(widget.btnText),
      style: TextButton.styleFrom(
        primary: Colors.blue,
        //backgroundColor: Colors.green,
        //onSurface: Colors.black,
      ),
      onPressed: () {
        //forgot password screen
        widget.Pressed();
      },
      //child: const Text('Forgot Password?',),
    ),);
  }
}



