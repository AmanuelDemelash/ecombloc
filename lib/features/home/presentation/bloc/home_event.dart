part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeProductEventLoad extends HomeEvent {}

class HomeProductSearchEvent extends HomeEvent {
  final String title;

  const HomeProductSearchEvent({required this.title});

  @override
  List<Object> get props => [title];
}
