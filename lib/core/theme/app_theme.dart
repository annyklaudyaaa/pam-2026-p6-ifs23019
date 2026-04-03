// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // Pastikan AppTypography.textTheme sudah kamu definisikan di file terpisah
    textTheme: AppTypography.textTheme,
    colorScheme: const ColorScheme.light(
      primary: kLightPrimary,
      onPrimary: kLightOnPrimary,
      primaryContainer: kLightPrimaryContainer,
      onPrimaryContainer: kLightOnPrimaryContainer,
      secondary: kLightSecondary,
      onSecondary: kLightOnSecondary,
      secondaryContainer: kLightSecondaryContainer,
      onSecondaryContainer: kLightOnSecondaryContainer,
      tertiary: kLightTertiary,
      onTertiary: kLightOnTertiary,
      error: kLightError,
      onError: kLightOnError,
      errorContainer: kLightErrorContainer,
      onErrorContainer: kLightOnErrorContainer,
      surface: kLightBackground, // Menggunakan background agar nuansa dessert lebih terasa
      onSurface: kLightOnBackground,
      surfaceContainerHighest: kLightSurfaceVariant,
      onSurfaceVariant: kLightOnSurfaceVariant,
      outline: kLightOutline,
    ),
    // Kamu bisa menambahkan kustomisasi tambahan di sini,
    // misalnya bentuk Card atau Button agar lebih "bulat" seperti donat/kue
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: AppTypography.textTheme,
    colorScheme: const ColorScheme.dark(
      primary: kDarkPrimary,
      onPrimary: kDarkOnPrimary,
      primaryContainer: kDarkPrimaryContainer,
      onPrimaryContainer: kDarkOnPrimaryContainer,
      secondary: kDarkSecondary,
      onSecondary: kDarkOnSecondary,
      secondaryContainer: kDarkSecondaryContainer,
      onSecondaryContainer: kDarkOnSecondaryContainer,
      tertiary: kDarkTertiary,
      onTertiary: kDarkOnTertiary,
      error: kDarkError,
      onError: kDarkOnError,
      errorContainer: kDarkErrorContainer,
      onErrorContainer: kDarkOnErrorContainer,
      surface: kDarkBackground,
      onSurface: kDarkOnBackground,
      surfaceContainerHighest: kDarkSurfaceVariant,
      onSurfaceVariant: kDarkOnSurfaceVariant,
      outline: kDarkOutline,
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}