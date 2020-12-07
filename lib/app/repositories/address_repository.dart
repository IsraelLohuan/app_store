import 'dart:convert';
import 'package:appstore/app/models/address.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:http/http.dart' as http;

class AddressRepository {

  Future<List<Address>> getAll() async {
    
    final response = await http.get(
      getEndpointApi("/enderecos")
    );

    if(response.statusCode == 200) {
      final value = json.decode(response.body);
      return value.map<Address>((json) => Address.fromJson(json)).toList();
    }

    throw Exception("OPA! Algo de inesperado ocorreu! Code: ${response.statusCode}");
  }
}