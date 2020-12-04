
import 'package:flutter/material.dart';

class LineOr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Divider(color: Colors.white,)),
          SizedBox(width: 5,),
          Text("OU", style: TextStyle(color: Colors.white),),
          SizedBox(width: 5,),
          Expanded(child: Divider(color: Colors.white,)),
        ]
    );
  }
}
