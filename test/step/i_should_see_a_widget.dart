import 'package:ecombloc/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see a {BottomNav} widget
Future<void> iShouldSeeAWidget(WidgetTester tester, BottomNav param1) async {
  expect(find.byType(BottomNav), findsOneWidget);
}
