import 'package:bloc_test/bloc_test.dart';
import 'package:ecombloc/features/home/presentation/bloc/categoryDetail/bloc/category_detail_bloc_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CategoryDetailBlocBloc categoryDetailBloc;
  setUpAll(() {
    categoryDetailBloc = CategoryDetailBlocBloc();
  });
  group('Category detail bloc', () {
    String categoryName = "jewelery";

    blocTest<CategoryDetailBlocBloc, CategoryDetailBlocState>(
      "handle category detail loaidng state",
      build: () => categoryDetailBloc,
      act: (bloc) =>
          bloc.add(LoadProductInCategoryEvent(category: categoryName)),
      expect: () => [CategoryDetailBlocLoading()],
    );

    tearDown(
      () => categoryDetailBloc.close(),
    );
  });
}
