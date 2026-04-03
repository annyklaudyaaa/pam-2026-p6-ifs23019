// lib/app.dart

import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_notifier.dart';

class DelcomDessertsApp extends StatefulWidget {
  const DelcomDessertsApp({super.key});

  @override
  State<DelcomDessertsApp> createState() => _DelcomDessertsAppState();
}

class _DelcomDessertsAppState extends State<DelcomDessertsApp> {
  // ThemeNotifier dibuat di level tertinggi agar bisa diakses seluruh app
  final ThemeNotifier _themeNotifier = ThemeNotifier(initial: ThemeMode.light);

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ThemeProvider membungkus seluruh app agar notifier bisa diakses di mana saja
    return ThemeProvider(
      notifier: _themeNotifier,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: _themeNotifier,
        builder: (context, themeMode, child) {
          return MaterialApp.router(
            title: 'Delcom Desserts',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,   // Dikontrol oleh ThemeNotifier
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}