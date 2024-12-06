part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class ChnageThemeEvent extends SettingEvent {
  final bool isDark;
  const ChnageThemeEvent({
    required this.isDark,
  });

  @override
  List<Object> get props => [isDark];
}
