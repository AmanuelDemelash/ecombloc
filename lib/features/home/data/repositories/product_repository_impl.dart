import 'package:dartz/dartz.dart';
import 'package:ecombloc/features/home/data/datasources/api_dataSource/api_data_source.dart';
import 'package:ecombloc/features/home/data/models/product_model.dart';
import 'package:ecombloc/features/home/domain/entities/category_entity.dart';
import 'package:ecombloc/features/home/domain/entities/product_entity.dart';
import 'package:ecombloc/features/home/domain/repositories/product_repository.dart';
import 'package:ecombloc/service_locator.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<Either<String, List<ProductModel>>> getAllProduct() async {
    return await sl<ApiDataSource>().getAllProduct();
  }

  @override
  Future<Either<String, List<CategoryEntity>>> getAllCategory()async{
    return await sl<ApiDataSource>().getAllCategory();
  }

  @override
  Future<Either<String, ProductEntity>> getProduct(int id)async{
    return await sl<ApiDataSource>().getProduct(id);
  }
}
