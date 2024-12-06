import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc()
      : super(SettingState(
          themeData: lightTheme,
          isDarkMode: false,
        )) {
    on<ChnageThemeEvent>((event, emit) {
      if (event.isDark) {
        emit(state.copyWith(event.isDark, darkTheme));
      } else {
        emit(state.copyWith(event.isDark, lightTheme));
      }
    });
  }
}
