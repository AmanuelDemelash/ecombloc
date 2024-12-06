import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecombloc/features/home/domain/entities/product_entity.dart';
import 'package:ecombloc/features/home/domain/usecases/get_all_product_usecase.dart';
import 'package:ecombloc/service_locator.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductEventLoad>((event, emit) async {
      emit(HomeProductLoading());
      Either response = await sl<GetAllProductUsecase>().call(null);
      response.fold(
        (l) => emit(HomeProductError(message: l.toString())),
        (r) => emit(HomeProductLoaded(products: r)),
      );
    });
  }
}