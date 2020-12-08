import 'dart:convert';
import 'package:appstore/app/models/address.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:http/http.dart' as http;

class AddressRepository {

  Future<void> insert(Address address) async {

    final response = await http.post(
      getEndpointApi("/endereco"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(address)
    );

    if(response.statusCode != 200) {
      throw Exception("OPA! Algo de inesperado ocorreu! Code: ${response.statusCode}");
    }
  }

  Future<bool> update(Address address) async {

    final response = await http.put(
        getEndpointApi("/endereco"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(address)
    );

    if(response.statusCode != 200) {
      throw Exception("OPA! Algo de inesperado ocorreu! Code: ${response.statusCode}");
    }

    return true;
  }

  Future<List<Address>> getAll() async {
    
    final response = await http.get(
      getEndpointApi("/enderecos")
    );

    if(response.statusCode == 200) {
      final value = json.decode(response.body);
      return value.map<Address>((json) => Address.fromJson(json)).toList();
    }

    if(response.statusCode == 204) {
      throw Exception("Você não possui endereço cadastrado!");
    }

    throw Exception("OPA! Algo de inesperado ocorreu! Code: ${response.statusCode}");
  }
}