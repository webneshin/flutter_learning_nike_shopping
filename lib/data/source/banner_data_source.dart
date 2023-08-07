import 'package:dio/dio.dart';
import 'package:flutter_learning_nike_shopping/data/banner.dart';
import 'package:flutter_learning_nike_shopping/data/common/http_data_validator.dart';

abstract class IBannerDataSource {
  Future<List<Banner>> getAll();
}

class BannerRemoteDataSource
    with HttpResponseValidatorMixin
    implements IBannerDataSource {
  final Dio httpClient;

  BannerRemoteDataSource(this.httpClient);

  @override
  Future<List<Banner>> getAll() async {
    final response = await httpClient.get('banner/slider');
    validateResponse(response);
    final List<Banner> banners = [];

    (response.data as List).forEach((element) {
      banners.add(Banner.fromJson(element));
    });
    return banners;
  }
}
