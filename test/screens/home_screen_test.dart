// test/widget/screens/home_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/app_theme.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/theme_notifier.dart';
import 'package:pam_p6_2026_ifs23019/features/home/home_screen.dart';

Widget buildHomeTest() {
  final notifier = ThemeNotifier(initial: ThemeMode.light);
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
  ]);

  return ThemeProvider(
    notifier: notifier,
    child: MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerConfig: router,
    ),
  );
}

void main() {
  group('HomeScreen (Dessert Theme)', () {
    testWidgets('merender tanpa error', (tester) async {
      await tester.pumpWidget(buildHomeTest());
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('menampilkan judul "Delcom Desserts" di AppBar', (tester) async {
      await tester.pumpWidget(buildHomeTest());
      await tester.pumpAndSettle();

      // Memastikan judul di AppBar sesuai dengan yang kita buat di HomeScreen
      expect(find.text('Delcom Desserts'), findsWidgets);
    });

    testWidgets('menampilkan teks penyambut "Sweet Treats"', (tester) async {
      await tester.pumpWidget(buildHomeTest());
      await tester.pumpAndSettle();

      // Mengecek banner utama bertema dessert
      expect(find.textContaining('Sweet Treats for You!'), findsOneWidget);
    });

    testWidgets('menampilkan minimal satu Card kategori', (tester) async {
      await tester.pumpWidget(buildHomeTest());
      await tester.pumpAndSettle();

      // Mencari widget Card yang digunakan untuk banner atau kategori
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('menampilkan emoji dessert (Cupcake)', (tester) async {
      await tester.pumpWidget(buildHomeTest());
      await tester.pumpAndSettle();

      // Memastikan kategori dessert muncul (mengganti emoji tanaman)
      expect(find.textContaining('🧁'), findsOneWidget);
    });

    testWidgets('tombol toggle mode tersedia (menampilkan ikon dark mode)', (tester) async {
      await tester.pumpWidget(buildHomeTest());
      await tester.pumpAndSettle();

      // Karena default-nya light mode, AppBar akan menampilkan ikon dark_mode untuk beralih
      expect(find.byIcon(Icons.dark_mode_rounded), findsOneWidget);
    });
  });
}