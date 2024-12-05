import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecombloc/features/home/domain/entities/product_entity.dart';
import 'package:ecombloc/features/home/domain/usecases/get_product_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../service_locator.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<GetProductDetailEvent>((event, emit)async{
      emit(ProductDetailLoadingState());
      Either response= await sl<GetProductUseCaes>().call(event.id);
      response.fold((l) => emit(ProductDetailErrorState(l)),(r) => emit(ProductDetailLoadedState(r)),);
    });
  }
}
