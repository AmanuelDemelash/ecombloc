part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeProductLoading extends HomeState {}

class HomeProductLoaded extends HomeState {
  final List<ProductEntity> products;
  const HomeProductLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class HomeProductError extends HomeState {
  final String message;
  const HomeProductError({required this.message});

  @override
  List<Object> get props => [message];
}

class HomeProductSearchLoaded extends HomeState {
  final List<ProductEntity> searchedProducts;
  const HomeProductSearchLoaded({required this.searchedProducts});

  @override
  List<Object> get props => [searchedProducts];
}
