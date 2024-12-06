import 'package:ecombloc/core/network/dio_client.dart';
import 'package:ecombloc/features/home/data/datasources/api_dataSource/api_data_source.dart';
import 'package:ecombloc/features/home/data/repositories/product_repository_impl.dart';
import 'package:ecombloc/features/home/domain/repositories/product_repository.dart';
import 'package:ecombloc/features/home/domain/usecases/get_all_category_usecase.dart';
import 'package:ecombloc/features/home/domain/usecases/get_all_product_usecase.dart';
import 'package:ecombloc/features/home/domain/usecases/get_product_by_category_usecase.dart';
import 'package:ecombloc/features/home/domain/usecases/get_product_usecase.dart';
import 'package:get_it/get_it.dart';

import 'features/home/presentation/bloc/bottomNav/bottom_nav_cubit.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  //bloc
  sl.registerFactory<BottomNavCubit>(
    () => BottomNavCubit(),
  );

  //usecase
  sl.registerSingleton<GetAllProductUsecase>(GetAllProductUsecase());
  sl.registerSingleton<GetAllCategoryUsecase>(GetAllCategoryUsecase());
  sl.registerSingleton<GetProductUseCaes>(GetProductUseCaes());
  sl.registerSingleton<GetProductByCategoryUsecase>(
      GetProductByCategoryUsecase());

  //repositories
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(),
  );

  //data source
  sl.registerSingleton<ApiDataSource>(APiDataSourceImple());

  //api client
  sl.registerSingleton<DioClient>(DioClient());
}
