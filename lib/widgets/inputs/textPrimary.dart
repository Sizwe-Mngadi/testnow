import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class textPrimary extends StatefulWidget {
  const textPrimary({Key? key, required this.title, required this.controller, required this.icon, this.validator, this.inputKey, this.inputType}) : super(key: key);
  final TextEditingController controller;
  final String title;
  final Icon icon;
  final Key? inputKey;
  final TextInputType? inputType;
  //final keyboardType? inputType;

  final String? Function(String?)? validator;
  //const textPrimary({required this.icon,required this.controller, , required this.width, required this.height, required this.obscureText, });


  @override
  State<textPrimary> createState() => _textPrimaryState();
}

class _textPrimaryState extends State<textPrimary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
        child: TextFormField(
          key: widget.inputKey,
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: widget.icon,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)),
            labelText: widget.title,
            contentPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          ),
          validator: widget.validator,
        ),
    );
  }
}
