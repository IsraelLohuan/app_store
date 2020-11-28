import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/modules/product/components/card_product.dart';
import 'package:appstore/app/modules/product/components/header.dart';
import 'package:appstore/app/modules/product/controllers/product_list_controller.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  ProductListController _productListController = ProductListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 8),
        child: StreamBuilder(
          stream: _productListController.streamListProducts,
          initialData: _productListController.products,
          builder: (context, snapshot) => ListView(children: data(snapshot.data))
        ),
      ),
      backgroundColor: Constants.COLOR_PRIMARY,
    );
  }

  List<Widget> data(List<Product> values) {
    
    List<Widget> result = [];
    
    result.add(Header(_productListController));

    values.forEach((product) => result.add(CardProduct(product)));

    return result;
  }
}
