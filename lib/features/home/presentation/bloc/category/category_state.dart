part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
}

final class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState{
  @override
  List<Object?> get props =>[];
}

class CategoryLoaded extends CategoryState{
  final List<CategoryEntity> categories;
  
  @override
  List<Object?> get props =>[categories];

  const CategoryLoaded(this.categories);
}

class CategoryError extends CategoryState{
  final String message;
  @override
  List<Object?> get props =>[message];

  const CategoryError(this.message);
}