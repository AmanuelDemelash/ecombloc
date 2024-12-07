import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see a list of categories
Future<void> iSeeAListOfCategories(WidgetTester tester) async {
  await tester.pumpAndSettle();
  final categoriesListWidget = find.byType(Scrollable);

  expect(categoriesListWidget, findsNWidgets(2));
  // final specificScrollable = find.byKey(const ValueKey('categorylist'));

  //final itemFinder = find.byKey(const ValueKey("category-index3"));

  // await tester.scrollUntilVisible(itemFinder, 4,
  //     scrollable: specificScrollable);

  // expect(itemFinder, findsOneWidget);
}
