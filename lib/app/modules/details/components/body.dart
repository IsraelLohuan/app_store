import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/modules/details/components/product_title_with_image.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

  final Product product;

  Body(this.product);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)
                      )
                  ),
                ),
                ProductTitleWithImage(product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
