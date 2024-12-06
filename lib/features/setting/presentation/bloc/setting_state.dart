// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final bool isDarkMode;
  final ThemeData themeData;
  const SettingState({
    required this.isDarkMode,
    required this.themeData,
  });

  SettingState copyWith(bool? isDarkMode, ThemeData? themeData) {
    return SettingState(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        themeData: themeData ?? this.themeData);
  }

  @override
  List<Object> get props => [isDarkMode, themeData];
}
