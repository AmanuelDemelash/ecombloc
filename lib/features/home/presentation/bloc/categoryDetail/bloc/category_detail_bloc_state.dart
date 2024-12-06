part of 'category_detail_bloc_bloc.dart';

sealed class CategoryDetailBlocState extends Equatable {
  const CategoryDetailBlocState();

  @override
  List<Object> get props => [];
}

final class CategoryDetailBlocInitial extends CategoryDetailBlocState {}

class CategoryDetailBlocLoading extends CategoryDetailBlocState {
  @override
  List<Object> get props => [];
}

class CategoryDetailBlocLoaded extends CategoryDetailBlocState {
  final List<ProductEntity> products;
  const CategoryDetailBlocLoaded({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}

class CategoryDetailBlocError extends CategoryDetailBlocState {
  final String message;
  const CategoryDetailBlocError({required this.message});

  @override
  List<Object> get props => [message];
}
