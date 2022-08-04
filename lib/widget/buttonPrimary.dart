

import 'package:flutter/material.dart';

class buttonPrimary extends StatefulWidget {
  const buttonPrimary({Key? key, required this.title,required this.onPressed}) : super(key: key);

  final String title;
  final void Function() onPressed;
  @override
  State<buttonPrimary> createState() => _buttonPrimaryState();
}

class _buttonPrimaryState extends State<buttonPrimary> {
  @override
  Widget build(BuildContext context) {
    return
    Column(
      children: [
        Divider(height: 20,),
      RaisedButton(
      textColor: Colors.white,
      child: Text(widget.title),
      onPressed: () {

        widget.onPressed();
      },
      color: Colors.red,
    )
      ],
    );

  }
}
