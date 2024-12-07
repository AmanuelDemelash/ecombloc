import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: the PageView should jump to the {1} Page and show the {"fac"} text
Future<void> thePageviewShouldJumpToThePageAndShowTheText(
    WidgetTester tester, int index, String text) async {
  final pageView = find.byKey(const Key("pageview"));
  expect(pageView, findsOneWidget);
  // Access the PageController through the PageView widget
  final pageViewFinder = tester.widget<PageView>(pageView);
  final controller = pageViewFinder.controller;

  // Jump to the desired index
  controller!.jumpToPage(index);

  // Wait for the animation to complete
  await tester.pumpAndSettle();

  // Verify that the PageView shows the correct page
  expect(find.text(text), findsOneWidget);
}
