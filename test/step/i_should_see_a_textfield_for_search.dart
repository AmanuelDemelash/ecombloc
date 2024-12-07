import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see a TextField for search
Future<void> iShouldSeeATextfieldForSearch(WidgetTester tester) async {
  expect(find.byKey(const Key('search')), findsOneWidget);
}
