import 'package:bloc_test/bloc_test.dart';
import 'package:ecombloc/features/home/presentation/bloc/productDetail/product_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProductDetailBloc productDetailBloc;
  setUpAll(() {
    productDetailBloc = ProductDetailBloc();
  });

  group('product detail bloc', () {
    int productId = 1;

    blocTest<ProductDetailBloc, ProductDetailState>(
      "handle product detail loaidng state",
      build: () => productDetailBloc,
      act: (bloc) => bloc.add(GetProductDetailEvent(id: productId)),
      expect: () => [ProductDetailLoadingState()],
    );

    tearDown(
      () => productDetailBloc.close(),
    );
  });
}
