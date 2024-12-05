
import 'package:dartz/dartz.dart';
import 'package:ecombloc/core/usecase/usecase.dart';
import 'package:ecombloc/features/home/domain/entities/category_entity.dart';
import 'package:ecombloc/features/home/domain/repositories/product_repository.dart';

import '../../../../service_locator.dart';

class GetAllCategoryUsecase extends Usecase<Either<String,List<CategoryEntity>>,void>{
  @override
  Future<Either<String, List<CategoryEntity>>> call(void props)async{
    return await sl<ProductRepository>().getAllCategory();
  }


}