part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeEventStarted extends HomeEvent{
  @override
  List<Object?> get props => [];

}

class HomeEventRefresh extends HomeEvent{
  @override
  List<Object?> get props => [];

}