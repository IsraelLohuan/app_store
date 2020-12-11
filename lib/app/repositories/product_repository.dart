import 'dart:convert';
import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/others/helper.dart';
import 'package:http/http.dart' as http;

class ProductRepository {

  Future<List<Product>> getAll() async {

    final response = await http.get(
        getEndpointApi("/products")
    );

    if(response.statusCode == 200) {
      final data = json.decode(response.body);
      return data.map<Product>((product) => Product.fromJson(product)).toList();
    }

    return [];
  }
}