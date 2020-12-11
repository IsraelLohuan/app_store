import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/modules/details/components/cart_counter.dart';
import 'package:appstore/app/shared/components/image_product.dart';
import 'package:flutter/material.dart';

class CardItemModel extends StatefulWidget {

  final Product product;

  CardItemModel(this.product);

  @override
  _CardItemModelState createState() => _CardItemModelState();
}

class _CardItemModelState extends State<CardItemModel> {

  Product get product => widget.product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Container(
        height: 85,
        child: Card(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              ImageCardItemModel(product),
              SizedBox(width: 10,),
              NameProductAndCartButton(product)
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCardItemModel extends StatelessWidget {

  final Product product;

  ImageCardItemModel(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ImageProduct(product),
      )
    );
  }
}

class NameProductAndCartButton extends StatelessWidget {

  final Product product;

  NameProductAndCartButton(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.titulo.toUpperCase(),
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 8,),
          CartCounter(product),
        ],
      ),
    );
  }
}

