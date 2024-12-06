import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecombloc/features/home/domain/entities/category_entity.dart';
import 'package:ecombloc/features/home/presentation/bloc/category/category_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../utils/injection_helper.dart';

void main() {
  late CategoryBloc categoryBloc;

  group('Category bloc', () {
    setUpAll(() {
      setupInjecton();
      categoryBloc = CategoryBloc();
    });

    List<CategoryEntity> categoryEntity = [CategoryEntity(title: "title")];
    MokGetAllCategoryUsecase mokGetAllCategoryUsecase =
        MokGetAllCategoryUsecase();

    blocTest<CategoryBloc, CategoryState>(
      "handle category loaidng state",
      build: () => categoryBloc,
      act: (bloc) => bloc.add(CategoryLoadEvent()),
      expect: () => [CategoryLoading()],
    );

    // blocTest<CategoryBloc, CategoryState>(
    //   "handle category loaded state",
    //   build: () => CategoryBloc(),
    //   setUp: () {
    //     when(mokGetAllCategoryUsecase.call(null)).thenAnswer((realInvocation) =>
    //         Future<Either<String, List<CategoryEntity>>>.value(
    //             Right(categoryEntity ?? [CategoryEntity(title: "title")])));
    //   },
    //   act: (bloc) => bloc.add(CategoryLoadEvent()),
    //   expect: () => [CategoryLoaded(categoryEntity)],
    // );
  });
}
