import 'dart:async';
import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/controllers/product_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ProductListController {

  ProductController _productController = BlocProvider.getBloc<ProductController>();

  List<Product> products;
  List<Product> productsSearch;

  ProductListController() {
    products = _productController.products;
    productsSearch = _productController.products;
  }

  StreamController _streamSearch = StreamController<bool>.broadcast();
  StreamController _streamListProducts = StreamController<List<Product>>.broadcast();

  Stream get streamSearch => _streamSearch.stream;
  Stream get streamListProducts => _streamListProducts.stream;

  void setListProducts(List<Product> values) {
    productsSearch = values;
    _streamListProducts.add(values);
  }

  void setSearch(bool value) {
    _streamSearch.add(value);
  }

  void search(String text) {

    List<Product> values = products.where((product) => product.titulo.toLowerCase().contains(text)).toList();

    setListProducts(values);
  }

  void dispose() {
    _streamSearch.close();
    _streamListProducts.close();
  }
}
