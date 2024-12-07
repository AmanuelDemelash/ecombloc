import 'package:dio/dio.dart';
import 'package:ecombloc/core/network/dio_client.dart';
import 'package:ecombloc/features/home/data/datasources/api_dataSource/api_data_source.dart';
import 'package:ecombloc/features/home/data/models/category_model.dart';
import 'package:ecombloc/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecombloc/features/home/data/models/product_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_data_source_test.mocks.dart';

@GenerateMocks([DioClient])
void main() {
  late APiDataSourceImple apiDataSource;
  late MockDioClient mockDioClient;
  setUp(() {
    mockDioClient = MockDioClient();
    apiDataSource = APiDataSourceImple();
    // Assuming you have a way to set the DioClient in your service locator
    if (sl.isRegistered<DioClient>()) {
      sl.unregister<DioClient>();
    }
    sl.registerSingleton<DioClient>(mockDioClient);
  });

  group('APiDataSourceImple', () {
    test('getAllProduct returns a list of ProductModel on success', () async {
      // Arrange
      when(mockDioClient.get(any)).thenAnswer((_) async => Response(
            data: [
              {
                "id": 1,
                "title":
                    "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                "price": 109.95,
                "description":
                    "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                "category": "men's clothing",
                "image":
                    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                "rating": {"rate": 3.9, "count": 120}
              },
              {
                "id": 2,
                "title": "Mens Casual Premium Slim Fit T-Shirts ",
                "price": 22.3,
                "description":
                    "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
                "category": "men's clothing",
                "image":
                    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
                "rating": {"rate": 4.1, "count": 259}
              },
            ],
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      // Act
      final result = await apiDataSource.getAllProduct();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected a list of ProductModel, but got an error: $l'),
        (r) {
          expect(r.length, 2);
          expect(r[0], isA<ProductModel>());
          expect(r[0].id, 1);
          expect(r[0].title,
              'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops');
        },
      );
    });

    test('getAllProduct returns an error on failure', () async {
      // Arrange
      when(mockDioClient.get(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.badResponse,
      ));

      // Act
      final result = await apiDataSource.getAllProduct();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, 'badResponse'),
        (r) => fail('Expected an error, but got a list of ProductModel: $r'),
      );
    });

    test('getAllCategory returns a list of CategoryModel on success', () async {
      // Arrange
      when(mockDioClient.get(any)).thenAnswer((_) async => Response(
            data: [
              "electronics",
              "jewelery",
              "men's clothing",
              "women's clothing"
            ],
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      // Act
      final result = await apiDataSource.getAllCategory();

      // Assert
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected a list of CategoryModel, but got an error: $l'),
        (r) {
          expect(r.length, 4);
          expect(r[0], isA<CategoryModel>());
          expect(r[0].title, "electronics");
        },
      );
    });

    test('getAllCategory returns an error on failure', () async {
      // Arrange
      when(mockDioClient.get(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.connectionError,
      ));

      // Act
      final result = await apiDataSource.getAllCategory();

      // Assert
      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, 'connectionError'),
        (r) => fail('Expected an error, but got a list of CategoryModel: $r'),
      );
    });
  });
}
