import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
