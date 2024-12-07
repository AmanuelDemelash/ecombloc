import 'package:flutter_test/flutter_test.dart';
import 'package:ecombloc/main.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  main();
  await tester.pumpAndSettle();
}
