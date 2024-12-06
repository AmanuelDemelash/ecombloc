import 'package:bloc_test/bloc_test.dart';
import 'package:ecombloc/config/theme/app_theme.dart';
import 'package:ecombloc/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SettingBloc settingBloc;
  group(
    "Setting Bloc",
    () {
      setUpAll(
        () {
          settingBloc = SettingBloc();
        },
      );

      blocTest<SettingBloc, SettingState>(
        "handle dark theme in setting bloc state",
        build: () => settingBloc,
        act: (bloc) => bloc.add(const ChnageThemeEvent(isDark: true)),
        expect: () => [SettingState(isDarkMode: true, themeData: darkTheme)],
      );

      blocTest<SettingBloc, SettingState>("handle light theme",
          build: () => SettingBloc(),
          act: (bloc) => bloc.add(const ChnageThemeEvent(isDark: false)),
          expect: () =>
              [SettingState(isDarkMode: false, themeData: lightTheme)]);
    },
  );
}
