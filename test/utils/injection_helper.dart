import 'package:ecombloc/core/network/dio_client.dart';
import 'package:ecombloc/features/home/data/datasources/api_dataSource/api_data_source.dart';
import 'package:ecombloc/features/home/data/repositories/product_repository_impl.dart';
import 'package:ecombloc/features/home/domain/repositories/product_repository.dart';
import 'package:ecombloc/features/home/domain/usecases/get_all_category_usecase.dart';
import 'package:ecombloc/features/home/domain/usecases/get_all_product_usecase.dart';
import 'package:ecombloc/features/home/domain/usecases/get_product_by_category_usecase.dart';
import 'package:ecombloc/features/home/domain/usecases/get_product_usecase.dart';
import 'package:ecombloc/features/home/presentation/bloc/bottomNav/bottom_nav_cubit.dart';
import 'package:ecombloc/service_locator.dart';
import 'package:mockito/mockito.dart';

void setupInjecton() {
  //bloc
  sl.registerFactory<BottomNavCubit>(
    () => BottomNavCubit(),
  );

  //usecase
  sl.registerSingleton<GetAllProductUsecase>(MokGetAllProductUsecase());
  sl.registerSingleton<GetAllCategoryUsecase>(MokGetAllCategoryUsecase());
  sl.registerSingleton<GetProductUseCaes>(MokGetProductUseCaes());
  sl.registerSingleton<GetProductByCategoryUsecase>(
      MokGetProductByCategoryUsecase());

  //repositories
  sl.registerLazySingleton<ProductRepository>(
    () => MOkProductRepository(),
  );

  //data source
  sl.registerSingleton<ApiDataSource>(MokAPiDataSourceImple());

  //api client
  sl.registerSingleton<DioClient>(MokDioClient());
}

class MokGetAllProductUsecase extends Mock implements GetAllProductUsecase {}

class MokGetAllCategoryUsecase extends Mock implements GetAllCategoryUsecase {}

class MokGetProductUseCaes extends Mock implements GetProductUseCaes {}

class MokGetProductByCategoryUsecase extends Mock
    implements GetProductByCategoryUsecase {}

class MOkProductRepository extends Mock implements ProductRepositoryImpl {}

class MokAPiDataSourceImple extends Mock implements APiDataSourceImple {}

class MokDioClient extends Mock implements DioClient {}
