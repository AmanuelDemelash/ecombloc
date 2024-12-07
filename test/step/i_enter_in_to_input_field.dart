import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I enter {"fg"} in to {TextField} input field
Future<void> iEnterInToInputField(
    WidgetTester tester, String param1, dynamic param2) async {
  await tester.enterText(find.byKey(const Key("search")), param1);
  await tester.pump();
}
