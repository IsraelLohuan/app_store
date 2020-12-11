import 'package:flutter/material.dart';

class ProgressCustom extends StatelessWidget {

  final Color color;

  ProgressCustom({this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
