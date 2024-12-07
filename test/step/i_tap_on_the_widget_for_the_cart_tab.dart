import 'package:ecombloc/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap{Icons.shopping_bag} on the {BottomNav()} widget for the cart tab
Future<void> iTapOnTheWidgetForTheCartTab(
    WidgetTester tester, IconData param1, BottomNav param2) async {
  final cartIcon = find.byIcon(param1);
  await tester.tap(cartIcon);
}
