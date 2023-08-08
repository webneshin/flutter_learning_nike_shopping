
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_nike_shopping/common/exception.dart';
import 'package:flutter_learning_nike_shopping/data/banner.dart';
import 'package:flutter_learning_nike_shopping/data/product.dart';
import 'package:flutter_learning_nike_shopping/data/repo/banner_repository.dart';
import 'package:flutter_learning_nike_shopping/data/repo/product_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository bannerRepository;
  final IProductRepository productRepository;

  HomeBloc({required this.bannerRepository, required this.productRepository})
      : super(HomeStateLoading()) {
    on<HomeEvent>((event, emit) async {
      try {
        emit(HomeStateLoading());
        if (event is HomeEventStarted || event is HomeEventRefresh) {
          final banners = await bannerRepository.getAll();
          final latestProducts = await productRepository.getAll(ProductSort.latest);
          final popularProducts = await productRepository.getAll(ProductSort.popular);
          emit(HomeStateSuccess(latestProducts: latestProducts, popularProducts: popularProducts, banners: banners));
        }
      } catch (e) {
        emit(HomeStateError(exception: e is AppException ? e : AppException()));
      }
    });
  }
}
