import 'package:ecombloc/config/route/app_route.dart';
import 'package:ecombloc/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
