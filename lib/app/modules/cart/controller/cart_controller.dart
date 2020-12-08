import 'package:appstore/app/models/product.dart';

class CartController {

  List<Product> _cartProducts = [];

  void addProduct(Product product) {
    _cartProducts.add(product);
  }

  void incrementQuantityProduct(Product product) {

    if(!productInCart(product.id)) {
      addProduct(product);
    } else {
      int index = getIndexProduct(product.id);
      _cartProducts[index].cartQuantity ++;
    }
  }

  void decrementQuantityProduct(Product product) {
    product.cartQuantity --;
  }

  int getQuantityProductInCart(Product product) {

    if(!productInCart(product.id))
      return 0;

    int index = getIndexProduct(product.id);
    return _cartProducts[index].cartQuantity;
  }

  bool productInCart(int id) {
    return _cartProducts.firstWhere((product) => product.id == id, orElse: () => null) != null;
  }

  int getIndexProduct(int id) {
    return _cartProducts.indexWhere((product) => product.id == id);
  }
}