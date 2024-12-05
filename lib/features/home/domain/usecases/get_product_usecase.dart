
import 'package:dartz/dartz.dart';
import 'package:ecombloc/core/usecase/usecase.dart';
import 'package:ecombloc/features/home/domain/entities/product_entity.dart';
import 'package:ecombloc/features/home/domain/repositories/product_repository.dart';

import '../../../../service_locator.dart';

class GetProductUseCaes extends Usecase<Either<String,ProductEntity>,int>{
  @override
  Future<Either<String, ProductEntity>> call(int? props)async{
    return await sl<ProductRepository>().getProduct(props!);
  }
  
}