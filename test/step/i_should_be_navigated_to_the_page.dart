import 'package:flutter_test/flutter_test.dart';

/// Usage: I should be navigated to the {Setting} Page
Future<void> iShouldBeNavigatedToThePage(
    WidgetTester tester, Type param1) async {
  final setting = find.byType(param1);
  expect(setting, findsOneWidget);
  await tester.pumpAndSettle();

  expect(find.text("Setting"), findsOneWidget);
}
