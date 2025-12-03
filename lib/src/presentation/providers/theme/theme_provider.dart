import 'package:flutter/material.dart';
import 'package:plux/src/presentation/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    // Load initial theme from LocalStorage
    final isDark = ref.read(localStorageProvider).isDarkTheme();
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final isDark = state == ThemeMode.dark;
    await ref.read(localStorageProvider).setTheme(isDark: !isDark);
    state = isDark ? ThemeMode.light : ThemeMode.dark;
  }
}
