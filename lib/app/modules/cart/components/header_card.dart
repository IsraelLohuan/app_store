
import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {

  final IconData icon;
  final String textHeader;

  HeaderCard(this.icon, this.textHeader);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.grey,
        ),
        SizedBox(width: 16,),
        Text(
          textHeader,
          style: TextStyle(
              color: Colors.grey
          ),
        )
      ],
    );
  }
}
