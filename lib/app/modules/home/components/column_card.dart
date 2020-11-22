import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/components/card/image_card.dart';
import 'package:appstore/app/shared/components/card/image_with_box_black.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class ColumnCard extends StatelessWidget {

  final Function onTap;
  final Product product;
  final int typeCard;

  ColumnCard(this.product, this.typeCard, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        child: Card(child: CardContent(product, typeCard)),
      ),
    );
  }
}

class CardContent extends StatelessWidget {

  final int typeCard;
  final Product product;

  CardContent(this.product, this.typeCard);

  @override
  Widget build(BuildContext context) {
    return typeCard == Constants.TYPE_CARD_PROMOTIONAL ? ImageWithBoxBlack(product) : ImageCard(product);
  }
}

