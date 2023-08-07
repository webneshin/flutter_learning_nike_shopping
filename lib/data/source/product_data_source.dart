import 'package:dio/dio.dart';
import 'package:flutter_learning_nike_shopping/data/common/http_data_validator.dart';
import 'package:flutter_learning_nike_shopping/data/product.dart';

abstract class IProductDataSource{
  Future<List<Product>> getAll(int sort);
  Future<List<Product>> search(String searchTerm);
}

class ProductRemoteDataSource with HttpResponseValidatorMixin implements IProductDataSource{
  final Dio httpClient;

  ProductRemoteDataSource(this.httpClient);

  @override
  Future<List<Product>> getAll(int sort) async {
    final response = await httpClient.get('product/list?sort=$sort');
    validateResponse(response);
    // final products = <Product>[];
    final List<Product> products = [];
    (response.data as List).forEach((element) {
      products.add(Product.fromJson(element));
    });
    return products;
  }

  @override
  Future<List<Product>> search(String searchTerm) async {
    final response = await httpClient.get('product/search?q=$searchTerm');
    validateResponse(response);
    final products = <Product>[];
    (response.data as List).forEach((element) {
      products.add(Product.fromJson(element));
    });
    return products;
  }
}