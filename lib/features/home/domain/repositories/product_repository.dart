import 'package:dartz/dartz.dart';
import 'package:ecombloc/features/home/domain/entities/category_entity.dart';
import 'package:ecombloc/features/home/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductEntity>>> getAllProduct();
  Future<Either<String, List<CategoryEntity>>> getAllCategory();
  Future<Either<String, ProductEntity>> getProduct(int id);
  Future<Either<String, List<ProductEntity>>> getProductsByCategory(
      String category);
}
