import 'dart:convert';
import 'package:appstore/app/models/order.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:http/http.dart' as http;

class OrderRepository {

  Future<bool> registerOrder(Order order) async {

    final response = await http.post(
      getEndpointApi("/order"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(order)
    );

    if(response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }

    throw Exception("OPA! Algo de inesperado ocorreu! Code: ${response.statusCode}");
  }

  Future<List<Order>> getOrders() async {

    final response = await http.get(
        getEndpointApi("/orders")
    );

    if(response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body).map<Order>((orderJson) => Order.fromJson(orderJson)).toList();
    }

    throw Exception("OPA! Algo de inesperado ocorreu! Code: ${response.statusCode}");
  }

  Future<Order> getOrder(id) async {

    final response = await http.get(
        getEndpointApi("/order/${id}")
    );

    if(response.statusCode == 200) {
      return Order.fromJson(json.decode(response.body)[0]);
    }

    throw Exception("OPA! Algo de inesperado ocorreu! Code: ${response.statusCode}");
  }
}