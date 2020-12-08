import 'dart:async';

import 'package:appstore/app/models/product.dart';

class CartController {

  StreamController _streamCounter = StreamController<int>.broadcast();

  Stream get streamCounter => _streamCounter.stream;

  List<Product> _cartProducts = [];

  void addProduct(Product product) {
    product.cartQuantity = 1;
    _cartProducts.add(product);
  }

  void incrementQuantityProduct(Product product) {

    if(!productInCart(product.id)) {
      addProduct(product);
    } else {
      int index = getIndexProduct(product.id);
      _cartProducts[index].cartQuantity ++;
    }

    _streamCounter.add(_cartProducts.length);
  }

  void decrementQuantityProduct(Product product) {

    product.cartQuantity --;

    if(product.cartQuantity == 0) {
      _cartProducts.removeAt(getIndexProduct(product.id));
    }

    _streamCounter.add(_cartProducts.length);
  }

  int getQuantityProductInCart(Product product) {

    if(!productInCart(product.id))
      return 0;

    return getProductByIndex(product.id).cartQuantity;
  }

  bool productInCart(int id) {
    return _cartProducts.firstWhere((product) => product.id == id, orElse: () => null) != null;
  }

  int getIndexProduct(int id) {
    return _cartProducts.indexWhere((product) => product.id == id);
  }

  Product getProductByIndex(int id) {
    int index = getIndexProduct(id);
    return _cartProducts[index];
  }

  void dispose() {
    _streamCounter.close();
  }
}