import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see a PageView widget
Future<void> iShouldSeeAPageviewWidget(WidgetTester tester) async {
  expect(find.byKey(const Key("pageview")), findsOneWidget);
}
