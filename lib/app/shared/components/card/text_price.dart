import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/material.dart';

class TextPrice extends StatelessWidget {

  final Product product;
  final int typeCard;

  TextPrice(this.product, this.typeCard);

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    if(typeCard == Constants.TYPE_CARD_PROMOTIONAL) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            formatNumberInReal(product.preco),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
                decoration: TextDecoration.lineThrough
            ),
          ),
          SizedBox(width: 10,),
          Text(
            formatNumberInReal(product.preco - product.desconto),
            style: TextStyle(color: Constants.COLOR_SECONDARY, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }

    return Text(
      formatNumberInReal(product.preco),
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
