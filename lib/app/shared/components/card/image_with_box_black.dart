import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/components/card/image_card.dart';
import 'package:flutter/material.dart';
import 'box_black_off.dart';

class ImageWithBoxBlack extends StatelessWidget {

  final Product product;

  ImageWithBoxBlack(this.product);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ImageCard(product),
        BoxBlackOff(product)
      ],
    );
  }
}
