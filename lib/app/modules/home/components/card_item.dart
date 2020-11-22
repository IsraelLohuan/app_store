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
  final Function onTap;

  CardItem({this.typeCard = 3, this.product, this.onTap});

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  int get typeCard => widget.typeCard;
  Product get product => widget.product;
  Function get onTap => widget.onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _card(),
        _stars(),
        SizedBox(
          height: 8,
        ),
        Text(
          product.titulo,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 8,
        ),
        _textPrice()
      ],
    );
  }

  Widget _textPrice() {
    if(typeCard == CardItem.TYPE_CARD_PROMOTIONAL) {
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

  Widget _card() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        child: Card(child: _cardContent()),
      ),
    );
  }

  Widget _cardContent() {

    if(typeCard == CardItem.TYPE_CARD_PROMOTIONAL) {
      return Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Image.memory(getBytesImage(product.base64)),
            )
          ),
          Align(
            child: Opacity(
              opacity: 0.8,
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: 18,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    "${getPercentualValue(product.preco, product.desconto)}% OFF",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ),
            ),
            alignment: Alignment.bottomRight,
          )
        ],
      );
    }
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Image.memory(getBytesImage(product.base64)),
      ),
    );
  }

  Widget _stars() {
    return Visibility(
      visible: typeCard == CardItem.TYPE_CARD_FEATURED,
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
