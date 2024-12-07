import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see a list of products
Future<void> iSeeAListOfProducts(WidgetTester tester) async {
  await tester.pumpAndSettle();
  final productListWidget = find.byType(Scrollable);

  expect(productListWidget, findsNWidgets(2));
}
