import 'package:dartz/dartz.dart';
import 'package:ecombloc/core/usecase/usecase.dart';
import 'package:ecombloc/features/home/domain/entities/product_entity.dart';
import 'package:ecombloc/features/home/domain/repositories/product_repository.dart';
import 'package:ecombloc/service_locator.dart';

class GetProductByCategoryUsecase
    extends Usecase<Either<String, List<ProductEntity>>, String> {
  @override
  Future<Either<String, List<ProductEntity>>> call(String? props) async {
    return await sl<ProductRepository>().getProductsByCategory(props!);
  }
}
