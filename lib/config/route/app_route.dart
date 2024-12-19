import 'package:ecombloc/features/home/presentation/pages/category_detail.dart';
import 'package:ecombloc/features/home/presentation/pages/product_detail.dart';
import 'package:ecombloc/features/setting/presentation/pages/setting.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings routeSetting) {
    final dynamic args = routeSetting.arguments;
    switch (routeSetting.name) {
      case ('/'):
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case ('/product-detail'):
        return MaterialPageRoute(
          builder: (context) => ProductDetail(
            id: args,
          ),
        );
      case ('/category'):
        return MaterialPageRoute(
            builder: (context) => CategoryDetail(categoryName: args));
      case ('/setting'):
        return MaterialPageRoute(builder: (context) => const Setting());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("page not found"),
            ),
          ),
        );
    }
  }
}
