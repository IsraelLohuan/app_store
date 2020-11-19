import 'package:appstore/app/models/product.dart';
import 'package:appstore/app/repositories/product_repository.dart';

class ProductController {

  List<Product> _products;
  ProductRepository _productRepository;

  List<Product> get products => _products;

  ProductController() {
    _productRepository = ProductRepository();
  }

  Future setListProcuctValue() async {
    _products = await _productRepository.getAll();
  }

  List<Product> productsFeatured() {
    return _products.where((product) => product.destaque == true).toList();
  }

  List<Product> productsPromotional() {
    return _products.where((product) => product.desconto > 0).toList();
  }
}