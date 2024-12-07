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
  if (sl.isRegistered<BottomNavCubit>()) {
    sl.unregister<BottomNavCubit>();
  }
  sl.registerFactory<BottomNavCubit>(() => BottomNavCubit());

  //usecase
  if (sl.isRegistered<GetAllProductUsecase>()) {
    sl.unregister<GetAllProductUsecase>();
  }
  sl.registerSingleton<GetAllProductUsecase>(GetAllProductUsecase());

  if (sl.isRegistered<GetAllCategoryUsecase>()) {
    sl.unregister<GetAllCategoryUsecase>();
  }
  sl.registerSingleton<GetAllCategoryUsecase>(GetAllCategoryUsecase());

  if (sl.isRegistered<GetProductUseCaes>()) {
    sl.unregister<GetProductUseCaes>();
  }
  sl.registerSingleton<GetProductUseCaes>(GetProductUseCaes());

  if (sl.isRegistered<GetProductByCategoryUsecase>()) {
    sl.unregister<GetProductByCategoryUsecase>();
  }
  sl.registerSingleton<GetProductByCategoryUsecase>(
      GetProductByCategoryUsecase());

  //repositories
  if (sl.isRegistered<ProductRepository>()) {
    sl.unregister<ProductRepository>();
  }
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(),
  );

  //data source
  if (sl.isRegistered<ApiDataSource>()) {
    sl.unregister<ApiDataSource>();
  }
  sl.registerSingleton<ApiDataSource>(APiDataSourceImple());

  //api client
  if (sl.isRegistered<DioClient>()) {
    sl.unregister<DioClient>();
  }
  sl.registerSingleton<DioClient>(DioClient());
}
