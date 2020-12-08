import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextCostumer extends StatelessWidget {

  final IconData icon;
  final String label;
  final Function validator;
  final List<TextInputFormatter> inputFormatter;
  final TextEditingController controller;
  final bool enabled;

  InputTextCostumer({this.label, this.icon, this.validator, this.inputFormatter, this.controller, this.enabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatter,
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
          errorStyle: TextStyle(
            color: Colors.white
          ),
          icon: Icon(
            icon,
            color: Colors.white,
          )
      ),
      validator: validator,
      style: TextStyle(
        color: Colors.white
      ),
      controller: controller,
      enabled: enabled,
    );
  }
}
