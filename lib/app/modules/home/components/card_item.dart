
import 'package:appstore/app/shared/constants.dart';
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

  final imagesRandom = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTfUpOb7t-9-Y9NU90eDY8WdYjaeiddMem6G8gKwUWdnommhCu9h3U2QoiGVvo8zgw7_BoGxHs&usqp=CAc",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ93AxXuTaYPlc9QtJ1RiPiqe3-66w-OqWxwlqV_WpD_dn9z7Pl4rjUdfhLJh8EwydzPphMRyA&usqp=CAc",
  ];

  @override
  Widget build(BuildContext context) {

    imagesRandom.shuffle();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _card(),
        _stars(),
        SizedBox(height: 8,),
        Text(
          "Relógio Calvin Klein",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        SizedBox(height: 8,),
        Text(
          "R\$ 280,00",
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
      child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Image.network(imagesRandom.first),
         )
      ),
    );
  }

  Widget _stars() {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: Constants.COLOR_YELLOW, size: 15,),
        Icon(Icons.star, color: Constants.COLOR_YELLOW, size: 15,),
        Icon(Icons.star, color: Constants.COLOR_YELLOW, size: 15,),
        Icon(Icons.star, color: Constants.COLOR_YELLOW, size: 15,)
      ],
    );
  }
}
