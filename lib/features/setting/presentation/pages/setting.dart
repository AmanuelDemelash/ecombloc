import 'package:ecombloc/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return Column(
            children: [
              ListTile(
                title: const Text("dark theme"),
                trailing: Switch.adaptive(
                  value: state.isDarkMode,
                  onChanged: (value) {
                    context
                        .read<SettingBloc>()
                        .add(ChnageThemeEvent(isDark: value));
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
