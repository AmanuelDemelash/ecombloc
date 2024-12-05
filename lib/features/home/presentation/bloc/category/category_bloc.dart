import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecombloc/features/home/domain/entities/category_entity.dart';
import 'package:ecombloc/features/home/domain/usecases/get_all_category_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../service_locator.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryLoadEvent>((event, emit)async{
      emit(CategoryLoading());
      Either response=await sl<GetAllCategoryUsecase>().call(null);
      response.fold((l) => emit(CategoryError(l)),(r) => emit(CategoryLoaded(r),));
    });
  }
}
