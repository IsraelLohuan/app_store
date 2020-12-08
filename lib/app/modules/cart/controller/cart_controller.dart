import 'package:appstore/app/models/product.dart';

class CartController {

  List<Product> _cartProducts = [];

  void addProduct(Product product) {
    _cartProducts.add(product);
  }

  void incrementQuantityProduct(Product product) {

    int id = product.id;

    if(!productInCart(id)) {
      addProduct(product);
    } else {
      int index = getIndexProduct(id);
      _cartProducts[index].cartQuantity ++;
    }
  }

  void decrementQuantityProduct(Product product) {
    product.cartQuantity --;
  }

  bool productInCart(int id) {
    return _cartProducts.firstWhere((product) => product.id == id) != null;
  }

  int getIndexProduct(int id) {
    return _cartProducts.indexWhere((product) => product.id == id);
  }
}