import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottomNav/bottom_nav_cubit.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return NavigationBar(
            selectedIndex: state,
            onDestinationSelected: (value) =>
                context.read<BottomNavCubit>().chnageBottomIndex(value),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: const Duration(seconds: 1),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_bag), label: 'Cart'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ]);
      },
    );
  }
}
