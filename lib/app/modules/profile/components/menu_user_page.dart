
import 'package:flutter/material.dart';

class MenuUserPage extends StatelessWidget {

  final IconData icon;
  final String title;
  final Function onPressed;

  MenuUserPage(this.icon, this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white
        ),
      ),
      onTap: onPressed,
    );
  }
}

