import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecombloc/core/ApiConstants/ApiUrl.dart';
import 'package:ecombloc/core/network/dio_client.dart';
import 'package:ecombloc/features/home/data/models/category_model.dart';
import 'package:ecombloc/features/home/data/models/product_model.dart';
import 'package:ecombloc/service_locator.dart';

abstract class ApiDataSource {
  Future<Either<String, List<ProductModel>>> getAllProduct();
  Future<Either<String, List<CategoryModel>>> getAllCategory();
  Future<Either<String, ProductModel>> getProduct(int id);
  Future<Either<String, List<ProductModel>>> getProductByCategory(
      String category);
}

class APiDataSourceImple implements ApiDataSource {
  @override
  Future<Either<String, List<ProductModel>>> getAllProduct() async {
    try {
      final response = await sl<DioClient>().get(Apiurl.products);

      final products = await Isolate.run(
        () {
          return (response.data as List)
              .map((e) => ProductModel.fromJson(e))
              .toList();
        },
      );

      return Right(products);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }

  @override
  Future<Either<String, List<CategoryModel>>> getAllCategory() async {
    try {
      final response = await sl<DioClient>().get(Apiurl.category);

      final categories = await Isolate.run(
        () {
          return (response.data as List)
              .map(
                (e) => CategoryModel.fromJson({"title": e}),
              )
              .toList();
        },
      );

      return Right(categories);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }

  @override
  Future<Either<String, ProductModel>> getProduct(int id) async {
    try {
      final response = await sl<DioClient>().get("${Apiurl.products}/$id");
      return Right(ProductModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getProductByCategory(
      String category) async {
    try {
      final response =
          await sl<DioClient>().get("${Apiurl.productInCategory}/$category");
      final products = await Isolate.run(
        () {
          return (response.data as List)
              .map((e) => ProductModel.fromJson(e))
              .toList();
        },
      );
      return Right(products);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }
}
