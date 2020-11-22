import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/material.dart';

class BoxBlackOff extends StatelessWidget {

  final Product product;

  BoxBlackOff(this.product);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Opacity(
        opacity: 0.8,
        child: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: 18,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                "${getPercentualValue(product.preco, product.desconto)}% OFF",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                ),
                textAlign: TextAlign.center,
              ),
            )
        ),
      ),
      alignment: Alignment.bottomRight,
    );
  }
}
