import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/components/progress_custom.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {

  final Product product;
  final double heigth;
  final double width;

  ImageProduct(this.product, {this.heigth = 180, this.width = 180});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: product.url,
      placeholder: (context, url) => Center(
        child: ProgressCustom(color: Constants.COLOR_PRIMARY,),
      ),
      errorWidget: (context, url, error) => Image.asset("assets/images/image_not_found.png"),
      height: heigth,
      width: width,
    );
  }
}
