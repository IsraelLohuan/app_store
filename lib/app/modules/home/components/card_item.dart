
import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {

  static const TYPE_CARD_FEATURED = 1;
  static const TYPE_CARD_PROMOTIONAL = 2;
  static const TYPE_CARD_GENERAL = 3;

  final int typeCard;

  final Product product;

  CardItem({this.typeCard = 3, this.product});

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {

  Product get product => widget.product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _card(),
        _stars(),
        SizedBox(height: 8,),
        Text(
          product.titulo,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        SizedBox(height: 8,),
        Text(
          formatNumberInReal(product.preco),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  Widget _card() {
    return Container(
      width: 150,
      height: 150,
      child: Card(child: _image()),
    );
  }

  Widget _image() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Image.memory(getBytesImage(product.base64)),
    );
  }

  Widget _stars() {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: Constants.COLOR_YELLOW, size: 15,),
        Icon(Icons.star, color: Constants.COLOR_YELLOW, size: 15,),
        Icon(Icons.star, color: Constants.COLOR_YELLOW, size: 15,),
        Icon(Icons.star, color: Constants.COLOR_YELLOW, size: 15,),
        Icon(Icons.star, color: Constants.COLOR_YELLOW, size: 15,)
      ],
    );
  }
}
