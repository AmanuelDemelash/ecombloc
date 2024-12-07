import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see a {BottomNavigationBar}
Future<void> iShouldSeeA(WidgetTester tester, dynamic param1) async {
  final bottomNav = find.byWidget(param1);
  expect(bottomNav, findsOneWidget);
}
