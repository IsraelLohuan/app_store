
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class Stars extends StatelessWidget {

  final int typeCard;

  Stars(this.typeCard);

  @override
  Widget build(BuildContext context) {
    return  Visibility(
      visible: typeCard == Constants.TYPE_CARD_FEATURED,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Constants.COLOR_YELLOW,
            size: 15,
          ),
          Icon(
            Icons.star,
            color: Constants.COLOR_YELLOW,
            size: 15,
          ),
          Icon(
            Icons.star,
            color: Constants.COLOR_YELLOW,
            size: 15,
          ),
          Icon(
            Icons.star,
            color: Constants.COLOR_YELLOW,
            size: 15,
          ),
          Icon(
            Icons.star,
            color: Constants.COLOR_YELLOW,
            size: 15,
          )
        ],
      ),
    );
  }
}
