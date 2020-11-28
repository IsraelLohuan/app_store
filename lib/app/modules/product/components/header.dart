import 'package:appstore/app/modules/product/components/icon_search.dart';
import 'package:appstore/app/modules/product/components/search.dart';
import 'package:appstore/app/modules/product/controllers/product_list_controller.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  final ProductListController productListController;

  Header(this.productListController);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: productListController.streamSearch,
      initialData: false,
      builder: (context, snapshot) {
        if(snapshot.data == true) {
          return Search(productListController);
        }

        return IconSearch(productListController);
      },
    );
  }
}
