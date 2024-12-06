import 'package:bloc_test/bloc_test.dart';
import 'package:ecombloc/features/home/domain/usecases/get_all_product_usecase.dart';
import 'package:ecombloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecombloc/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MocGetAllProductUseCase extends Mock implements GetAllProductUsecase {}

void main() {
  setUpAll(
    () {
      setup();
    },
  );
  group(
    "Home Bloc",
    () {
      blocTest<HomeBloc, HomeState>(
        "handle product loading state",
        build: () => HomeBloc(),
        act: (bloc) => bloc.add(HomeProductEventLoad()),
        expect: () => [HomeProductLoading()],
      );

      blocTest<HomeBloc, HomeState>(
        "handle product search load sccesfully",
        build: () => HomeBloc(),
        act: (bloc) => bloc.add(const HomeProductSearchEvent(title: 'f')),
        expect: () => [HomeProductSearchLoaded(searchedProducts: [])],
      );
    },
  );
}
