import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {

  static const TYPE_CARD_FEATURED = 1;
  static const TYPE_CARD_PROMOTIONAL = 2;
  static const TYPE_CARD_GENERAL = 3;

  final int typeCard;

  CardItem({this.typeCard = 3});

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Card(
        child: Column(
          children: <Widget>[
            Text("...")
          ],
        ),
      ),
    );
  }
}
