import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/modules/details/view/details_page.dart';
import 'package:appstore/app/shared/components/card/image_card.dart';
import 'package:appstore/app/shared/components/card/image_with_box_black.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/material.dart';

class ColumnCard extends StatelessWidget {

  final Product product;

  ColumnCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(DetailsPage.router, arguments: product),
      child: Container(
        width: 150,
        height: 150,
        child: Card(child: CardContent(product)),
      ),
    );
  }
}

class CardContent extends StatelessWidget {

  final Product product;

  CardContent(this.product);

  @override
  Widget build(BuildContext context) {
    return getTypeCard(product) == Constants.TYPE_CARD_PROMOTIONAL ? ImageWithBoxBlack(product) : ImageCard(product);
  }
}

