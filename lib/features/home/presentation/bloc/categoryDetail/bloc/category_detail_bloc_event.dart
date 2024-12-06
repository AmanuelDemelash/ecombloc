part of 'category_detail_bloc_bloc.dart';

sealed class CategoryDetailBlocEvent extends Equatable {
  const CategoryDetailBlocEvent();

  @override
  List<Object> get props => [];
}

class LoadProductInCategoryEvent extends CategoryDetailBlocEvent {
  final String category;
  const LoadProductInCategoryEvent({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}
