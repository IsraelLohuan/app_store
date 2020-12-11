import 'dart:async';
import 'package:appstore/app/models/address.dart';
import 'package:appstore/app/models/item_order.dart';
import 'package:appstore/app/models/order.dart';
import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/modules/auth/controllers/login_controller.dart';
import 'package:appstore/app/repositories/order_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class CartController {

  OrderRepository _orderRepository = OrderRepository();
  Address _address;
  List<Product> _cartProducts = [];

  StreamController _streamListProducts = StreamController<List<Product>>.broadcast();
  StreamController _streamLocation = StreamController<Address>.broadcast();
  StreamController _streamCounter = StreamController<int>.broadcast();

  Stream get streamListProducts => _streamListProducts.stream;
  Stream get streamLocation => _streamLocation.stream;
  Stream get streamCounter => _streamCounter.stream;
  List<Product> get cartProducts => _cartProducts;
  Address get address => _address;

  void setAddress(Address address) {
    _address = address;
    _streamLocation.add(_address);
  }

  void addProduct(Product product) {
    product.cartQuantity = 1;
    _cartProducts.add(product);
  }

  void incrementQuantityProduct(Product product) {
    if(!productInCart(product.id)) {
      addProduct(product);
    } else {
      Product _product = getProductByIndex(product.id);
      _product.cartQuantity ++;
    }

    updateStreams();
  }

  void decrementQuantityProduct(Product product) {
    if(productInCart(product.id)) {

      Product _product = getProductByIndex(product.id);
      _product.cartQuantity --;

      if(_product.cartQuantity == 0) {
        _cartProducts.removeAt(getIndexProduct(_product.id));
      }

      updateStreams();
    }
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

  double getDiscount() {
    double discount = 0;

    _cartProducts.forEach((product) => discount += product.desconto);

    return discount;
  }

  double getSubTotal() {
    double subtotal = 0;

    _cartProducts.forEach((product) => subtotal += (product.preco) * product.cartQuantity);

    return subtotal;
  }

  double getTotal() {
    double total = 0;

    _cartProducts.forEach((product) => total += (product.preco - product.desconto) * product.cartQuantity);

    return total;
  }

  void clearCart() {
    setAddress(null);
    _cartProducts.clear();
    updateStreams();
  }

  void updateStreams() {
    _streamCounter.add(_cartProducts.length);
    _streamListProducts.add(_cartProducts);
  }

  Future<bool> insertOrder() async {

    if(_address == null) {
      throw Exception("Necessário informar o endereco para entrega!");
    }

    List<ItemOrder> items = [];

    cartProducts.forEach((product) {
      ItemOrder item = ItemOrder(
        idProduto: product.id.toString(),
        deleted: "0",
        quantidade: product.cartQuantity.toString(),
        preco: product.preco.toString(),
        desconto: product.desconto.toString()
      );

      items.add(item);
    });

    Order order = Order(
      valorTotal: getTotal(),
      statusPedidoId: Order.APROVACAO.toString(),
      idPessoa: BlocProvider.getBloc<LoginController>().person.id,
      enderecoId: int.parse(address.id),
      items: items
    );

    return await _orderRepository.registerOrder(order);
  }

  void dispose() {
    _streamCounter.close();
    _streamLocation.close();
    _streamListProducts.close();
  }
}