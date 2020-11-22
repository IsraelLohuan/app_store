import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/modules/home/components/column_card.dart';
import 'package:appstore/app/shared/components/card/stars.dart';
import 'package:appstore/app/shared/components/card/text_price.dart';
import 'package:flutter/material.dart';

class ColumnItem extends StatefulWidget {

  final int typeCard;
  final Product product;

  ColumnItem({this.typeCard = 3, this.product});

  @override
  _ColumnItemState createState() => _ColumnItemState();
}

class _ColumnItemState extends State<ColumnItem> {
  int get typeCard => widget.typeCard;
  Product get product => widget.product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ColumnCard(product),
        Stars(product),
        SizedBox(height: 8,),
        Text(product.titulo, style: TextStyle(color: Colors.white)),
        SizedBox(height: 8,),
        TextPrice(product)
      ],
    );
  }
}
