import 'package:ecombloc/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap{Icons.favorite} on the {BottomNavigationBar} widget for the favorit tab
Future<void> iTapOnTheWidgetForTheFavoritTab(
    WidgetTester tester, IconData param1, BottomNav param2) async {
  final favIcon = find.byIcon(param1);
  await tester.tap(favIcon);
}
