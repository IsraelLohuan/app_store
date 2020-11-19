import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class LineOr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Divider(color: Constants.COLOR_PRIMARY,)),
          SizedBox(width: 5,),
          Text("OU"),
          SizedBox(width: 5,),
          Expanded(child: Divider(color: Constants.COLOR_PRIMARY,)),
        ]
    );
  }
}
