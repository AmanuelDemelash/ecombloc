import 'package:ecombloc/config/route/app_route.dart';
import 'package:ecombloc/config/theme/app_theme.dart';
import 'package:ecombloc/core/observer/blocObserver.dart';
import 'package:ecombloc/features/home/presentation/bloc/bottomNav/bottom_nav_cubit.dart';
import 'package:ecombloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecombloc/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:ecombloc/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/bloc/category/category_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingBloc(),
        ),
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(
          create: (context) => HomeBloc()..add(HomeProductEventLoad()),
        ),
        BlocProvider(
          create: (context) => CategoryBloc()..add(CategoryLoadEvent()),
        )
      ],
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state.isDarkMode ? darkTheme : lightTheme,
            initialRoute: '/',
            onGenerateRoute: AppRoute.generateRoute,
          );
        },
      ),
    );
  }
}
