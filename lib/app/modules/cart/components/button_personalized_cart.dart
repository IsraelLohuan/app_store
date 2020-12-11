import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class ButtonPersonalizedCart extends StatelessWidget {

  final Function onPressed;
  final String label;
  final IconData icon;
  final Color color;
  final bool inverse;

  ButtonPersonalizedCart(this.onPressed, this.label, this.icon, {this.color = Constants.COLOR_PRIMARY, this.inverse = false});

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      label: Text(
        label, style: TextStyle(
          color: inverse ? Constants.COLOR_PRIMARY : Colors.white
        ),
      ),
      icon: Icon(
          icon,
          color: inverse ? Constants.COLOR_PRIMARY : Colors.white,
      ),
      color: inverse ? Colors.white : color,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
