import 'dart:async';

import 'package:appstore/app/models/order.dart';
import 'package:appstore/app/modules/auth/controllers/login_controller.dart';
import 'package:appstore/app/repositories/order_repository.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class MyOrderController {

  OrderRepository _orderRepository = OrderRepository();

  List<Order> _orders = [];

  StreamController _streamListOrder = StreamController();

  Stream get streamListOrder => _streamListOrder.stream;

  Future<void> getAll() async {
    try {
      _orders = await _orderRepository.getOrders();
      _streamListOrder.add(getOrdersByUser());
    } catch(e) {
      _streamListOrder.addError(messageError(e.toString()));
    }
  }

  List<Order> getOrdersByUser() {

    LoginController _loginController = BlocProvider.getBloc<LoginController>();

    final result = _orders.where((order) => order.idPessoa == _loginController.person.id).toList();

    if(result.isEmpty) {
      throw Exception("Nao há histórico de pedidos para seu usuário!");
    }

    return result;
  }

  Future<Order> getOrder(id) async {
    return await _orderRepository.getOrder(id);
  }

  void dispose() {
    _streamListOrder.close();
  }
}