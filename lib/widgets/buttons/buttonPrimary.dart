import 'package:flutter/material.dart';

class buttonPrimary extends StatefulWidget {
  const buttonPrimary({Key? key, required this.onpress, required this.title, this.inputKey}) : super(key: key);

  final void Function() onpress;
  final String title;
  final Key? inputKey;
  @override
  State<buttonPrimary> createState() => _buttonPrimaryState();
}

class _buttonPrimaryState extends State<buttonPrimary> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),

        child: ElevatedButton(
          key: widget.inputKey,
          child: Text(widget.title),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.blue,
            shape: RoundedRectangleBorder( //to set border radius to button
                borderRadius: BorderRadius.circular(20)
            ),

          ),
          onPressed: () {
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => homeScreen()));
            //print('Email adrdress is:'+);
            widget.onpress();
          },
          //ButtonStyle
          //child: Colors.blue,
        )
    );
  }
}

