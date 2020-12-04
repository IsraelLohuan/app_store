import 'package:flutter/material.dart';

class InputTextRegister extends StatelessWidget {

  final IconData icon;
  final String label;
  final Function validator;

  InputTextRegister({this.label, this.icon, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.white
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusColor: Colors.white,
          hoverColor: Colors.white,
          fillColor: Colors.white,
          icon: Icon(
            icon,
            color: Colors.white,
          )
      ),
      validator: validator,
    );
  }
}
