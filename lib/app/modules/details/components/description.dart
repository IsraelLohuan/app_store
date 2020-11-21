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
        "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
