import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatelessWidget {

  final Product product;

  ProductTitleWithImage(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                product.titulo,
                style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
            ),
            Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "Preço\n"),
                        TextSpan(
                            text: formatNumberInReal(product.preco),
                            style: Theme.of(context)
                                .textTheme.headline4
                                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                        )
                      ]
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Image.memory(
                    getBytesImage((product.base64)),
                    height: 180,
                    width: 180,
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}
