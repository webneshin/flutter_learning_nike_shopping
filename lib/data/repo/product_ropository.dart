import 'package:dio/dio.dart';
import 'package:flutter_learning_nike_shopping/data/product.dart';
import 'package:flutter_learning_nike_shopping/data/source/product_data_source.dart';

final httpClient = Dio(
    BaseOptions(
    baseUrl: 'http://expertdevelopers.ir/api/v1/'
    ));
final productRepository = ProductRepository(ProductRemoteDataSource(httpClient));

abstract class IProductRepository {
  Future<List<Product>> getAll(int sort);

  Future<List<Product>> search(String searchTerm);
}

class ProductRepository implements IProductRepository {
  final IProductDataSource dataSource;

  ProductRepository(this.dataSource);

  @override
  Future<List<Product>> getAll(int sort) {
    return dataSource.getAll(sort);
  }

  @override
  Future<List<Product>> search(String searchTerm) {
    return dataSource.search(searchTerm);
  }
}
