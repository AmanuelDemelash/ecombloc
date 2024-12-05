import 'package:ecombloc/features/home/presentation/pages/product_detail.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings routeSetting) {
    final dynamic args=routeSetting.arguments;
    switch (routeSetting.name) {
      case ('/'):
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
      case ('/product-detail'):
        return MaterialPageRoute(
          builder: (context) => ProductDetail(id: args,),
        );
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
