import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Example: When I enter {'text'} into {1} input field
Future<void> iEnterIntoInputField(
  WidgetTester tester,
  String text,
  TextField index,
) async {
  final textField = find.byKey(const Key("search"));

  await tester.enterText(textField, text);
}
