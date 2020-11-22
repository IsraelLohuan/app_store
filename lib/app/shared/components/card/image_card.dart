import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {

  final Product product;

  ImageCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Image.memory(
            getBytesImage(product.base64),
            height: 80,
        ),
      ),
    );
  }
}
