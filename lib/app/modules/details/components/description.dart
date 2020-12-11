import 'package:appstore/app/models/product.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {

  final Product product;

  Description(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 16
      ),
      child: Text(
        product.descricao,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
