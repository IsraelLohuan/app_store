import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/modules/home/components/column_card.dart';
import 'package:appstore/app/shared/components/card/stars.dart';
import 'package:appstore/app/shared/components/card/text_price.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {

  final Product product;

  CardProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 130,
      child: Card(
        color: Constants.COLOR_PRIMARY,
        child: Row(
          children: <Widget>[
            ColumnCard(product),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(product.titulo, style: TextStyle(color: Colors.white)),
                SizedBox(height: 16,),
                Row(
                  children: <Widget>[
                    TextPrice(product),
                    SizedBox(width: 16,),
                  ],
                ),
                SizedBox(height: 16,),
                Stars(product)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
