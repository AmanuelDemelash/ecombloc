import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap {ChoiceChip} widget of index {1} on a category item
Future<void> iTapWidgetOfIndexOnACategoryItem(
  WidgetTester tester,
  Type param1,
  int index,
) async {
  await tester.pumpAndSettle();

  final lists = find.byType(Scrollable);
  expect(lists, findsWidgets);
}
