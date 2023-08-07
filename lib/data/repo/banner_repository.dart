import 'package:flutter_learning_nike_shopping/data/banner.dart';
import 'package:flutter_learning_nike_shopping/data/common/http_client.dart';
import 'package:flutter_learning_nike_shopping/data/source/banner_data_source.dart';

final bannerRepository = BannerRepository(BannerRemoteDataSource(httpClient));

abstract class IBannerRepository {
  Future<List<Banner>> getAll();
}

class BannerRepository implements IBannerRepository {
  final IBannerDataSource dataSource;

  BannerRepository(this.dataSource);

  @override
  Future<List<Banner>> getAll() {
    return dataSource.getAll();
  }

}