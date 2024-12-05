part of 'product_detail_bloc.dart';

sealed class ProductDetailState extends Equatable {
  const ProductDetailState();
}

final class ProductDetailInitial extends ProductDetailState {
  @override
  List<Object> get props => [];
}
class ProductDetailLoadingState extends ProductDetailState{
  @override
  List<Object?> get props =>[];

}
class ProductDetailLoadedState extends ProductDetailState{
  final ProductEntity product;

  @override
  List<Object?> get props =>[product];

  const ProductDetailLoadedState(this.product);
}
class ProductDetailErrorState extends ProductDetailState{
  final String error;
  @override
  List<Object?> get props =>[error];

  const ProductDetailErrorState(this.error);
}