import 'package:appstore/app/modules/product/controllers/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconSearch extends StatelessWidget {

  final ProductListController productListController;

  IconSearch(this.productListController);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: SvgPicture.asset("assets/icons/search.svg"),
        onPressed: () => productListController.setSearch(true),
      ),
    );
  }
}
