import 'package:ecombloc/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap{Icons.person} on the {BottomNav()} widget for the profile tab
Future<void> iTapOnTheWidgetForTheProfileTab(
    WidgetTester tester, IconData param1, BottomNav param2) async {
  final profileIcon = find.byIcon(param1);
  await tester.tap(profileIcon);
}
