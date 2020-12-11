import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/components/image_product.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {

  final Product product;

  ImageCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: ImageProduct(
          product,
          heigth: 80,
        )
      ),
    );
  }
}
