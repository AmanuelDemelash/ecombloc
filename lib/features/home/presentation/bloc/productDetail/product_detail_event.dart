part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
}

class GetProductDetailEvent extends ProductDetailEvent{
  final int id;
  @override
  List<Object?> get props =>[];

  const GetProductDetailEvent({required this.id});
}