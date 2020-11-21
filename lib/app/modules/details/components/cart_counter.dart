import 'package:flutter/material.dart';

class CartCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildOutlineButton(
          icon: Icons.remove
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16/2),
          child: Text("01", style: Theme.of(context).textTheme.headline6,),
        ),
        _buildOutlineButton(
            icon: Icons.add
        ),
      ],
    );
  }

  Widget _buildOutlineButton({IconData icon, Function onPressed}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13)
        ),
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}
