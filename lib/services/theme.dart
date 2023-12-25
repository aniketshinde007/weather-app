import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/services/database.dart';

part 'theme.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  ThemeMode build() {
    var themeMode = ref.read(databaseProvider).getPref('themeMode');
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void changeTheme(ThemeMode theme) async {
    state = theme;
    await ref.read(databaseProvider).putPref('themeMode', theme.name);
  }

  String currentThemeName() {
    if(state.name == 'system') return 'System default';
    return state.name.replaceFirst(state.name[0], state.name[0].toUpperCase());
  }
}

extension ThemeName on ThemeMode {
  String get fullName {
    if(name == 'system') return 'System default';
    return name.replaceFirst(name[0], name[0].toUpperCase());
  }
}