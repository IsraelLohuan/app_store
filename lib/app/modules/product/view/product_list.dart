import 'package:appstore/app/modules/product/components/card_product.dart';
import 'package:appstore/app/shared/controllers/product_controller.dart';
import 'package:appstore/app/shared/others/constants.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  ProductController _productController = BlocProvider.getBloc<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.COLOR_PRIMARY,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16),
        child: ListView(
            children: data()
        ),
      ),
      backgroundColor: Constants.COLOR_PRIMARY,
    );
  }


  List<Widget> data() {
    return _productController.products.map<Widget>((product) => CardProduct(product)).toList();
  }
}
