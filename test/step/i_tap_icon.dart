import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Example: When I tap {Icons.add} icon
Future<void> iTapIcon(
  WidgetTester tester,
  IconData icon,
) async {
  final iconButton = find.byIcon(icon);
  expect(iconButton, findsOneWidget);

  await tester.tap(iconButton);
  await tester.pumpAndSettle();
}
