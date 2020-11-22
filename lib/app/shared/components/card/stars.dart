
import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/material.dart';

class Stars extends StatelessWidget {

  final Product product;

  Stars(this.product);

  @override
  Widget build(BuildContext context) {
    return  Visibility(
      visible: getTypeCard(product) == Constants.TYPE_CARD_FEATURED  || product.destaque == true,
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
