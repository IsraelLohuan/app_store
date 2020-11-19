import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/shared/others/dio_custom.dart';
import 'package:dio/dio.dart';

class ProductRepository extends DioCustom {

  ProductRepository() : super();

  Future<List<Product>> getAll() async {

    Response value = await dio.get("/products");

    if(value.statusCode == 200) {
      return value.data.map<Product>((product) => Product.fromJson(product)).toList();
    }

    return [];
  }
}