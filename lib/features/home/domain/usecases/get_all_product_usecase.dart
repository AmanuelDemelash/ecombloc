import 'package:dartz/dartz.dart';
import 'package:ecombloc/core/usecase/usecase.dart';
import 'package:ecombloc/features/home/domain/entities/product_entity.dart';
import 'package:ecombloc/features/home/domain/repositories/product_repository.dart';
import 'package:ecombloc/service_locator.dart';

class GetAllProductUsecase
    implements Usecase<Either<String, List<ProductEntity>>, void> {
  @override
  Future<Either<String, List<ProductEntity>>> call(void param) async {
    return await sl<ProductRepository>().getAllProduct();
  }
}
