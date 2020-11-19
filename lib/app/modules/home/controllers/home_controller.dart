import 'dart:async';
import 'package:appstore/app/shared/controllers/product_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class HomeController {

  ProductController productController = BlocProvider.getBloc<ProductController>();

  Future searchAllProducts() async {
    await productController.setListProcuctValue();
    return productController.products;
  }
}