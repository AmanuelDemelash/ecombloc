import 'dart:isolate';

import 'package:ecombloc/features/home/presentation/bloc/bottomNav/bottom_nav_cubit.dart';
import 'package:ecombloc/features/home/presentation/pages/productPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNav(),
        body: BlocConsumer<BottomNavCubit, int>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) => PageView(
                  key: const Key("pageview"),
                  controller: pageController,
                  children: const [
                    ProductPage(),
                    Center(
                      child: Text("fav"),
                    ),
                    Center(
                      child: Text("cart"),
                    ),
                    Center(
                      child: Text("profile"),
                    ),
                  ],
                ),
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              pageController.jumpToPage(state);
            }));
  }
}

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        const SizedBox(
          width: 10,
        ),
        IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            }),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
