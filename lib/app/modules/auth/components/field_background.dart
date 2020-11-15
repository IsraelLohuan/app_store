import 'package:flutter/material.dart';

class FieldBackground extends StatelessWidget {

  final Icon sufixIcon;
  final String label;
  final TextEditingController controller;

  FieldBackground({this.label, this.sufixIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[100], // set border width
        borderRadius: BorderRadius.all(Radius.circular(10.0)), // set rounded corner radius/ make rounded corner of border
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: sufixIcon,
            hintText: label,
            border: InputBorder.none,),
        ),
      ),
    );
  }
}
