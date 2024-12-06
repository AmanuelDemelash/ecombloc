import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecombloc/features/home/domain/entities/product_entity.dart';
import 'package:ecombloc/features/home/domain/usecases/get_product_by_category_usecase.dart';
import 'package:ecombloc/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'category_detail_bloc_event.dart';
part 'category_detail_bloc_state.dart';

class CategoryDetailBlocBloc
    extends Bloc<CategoryDetailBlocEvent, CategoryDetailBlocState> {
  CategoryDetailBlocBloc() : super(CategoryDetailBlocInitial()) {
    on<LoadProductInCategoryEvent>((event, emit) async {
      emit(CategoryDetailBlocLoading());
      Either response =
          await sl<GetProductByCategoryUsecase>().call(event.category);
      response.fold(
        (l) => emit(CategoryDetailBlocError(message: l)),
        (r) => emit(CategoryDetailBlocLoaded(products: r)),
      );
    });
  }
}
