import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see search results related to {'fg'}
Future<void> iShouldSeeSearchResultsRelatedTo(
    WidgetTester tester, String param1) async {
  expect(find.byIcon(Icons.search), findsOne);
}
