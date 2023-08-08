part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeStateLoading extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeStateError extends HomeState {
  final AppException exception;

  const HomeStateError({required this.exception});

  @override
  // TODO: implement props
  List<Object?> get props => [exception];
}

class HomeStateSuccess extends HomeState {
  final List<Product> latestProducts;
  final List<Product> popularProducts;
  final List<Banner> banners;

  const HomeStateSuccess(
      {required this.latestProducts,
      required this.popularProducts,
      required this.banners});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
