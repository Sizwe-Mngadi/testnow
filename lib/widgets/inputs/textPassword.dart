import 'package:flutter/material.dart';

class textPassword extends StatefulWidget {
  const textPassword({Key? key, required this.title, required this.controller, required this.icon, this.validator, this.inputKey}) : super(key: key);
  final TextEditingController controller;
  final String title;
  final Icon icon;
  final Key? inputKey;

  final String? Function(String?)? validator;

  @override
  State<textPassword> createState() => _textPasswordState();
}

class _textPasswordState extends State<textPassword> {
  // show the password or not
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        key: widget.inputKey,
        obscureText: _isObscure,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)),
          labelText: widget.title,
          contentPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            // this button is used to toggle the password visibility
            suffixIcon: IconButton(
                icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
        ),
        validator: widget.validator,
      ),

    );
  }
}
