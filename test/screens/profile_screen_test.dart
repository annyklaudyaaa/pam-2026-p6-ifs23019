// test/widget/screens/profile_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/app_theme.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/theme_notifier.dart';
import 'package:pam_p6_2026_ifs23019/features/profile/profile_screen.dart';

Widget buildProfileTest() {
  final notifier = ThemeNotifier(initial: ThemeMode.light);
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (_, __) => const ProfileScreen()),
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
  group('ProfileScreen (Widget Test)', () {
    testWidgets('merender tanpa error', (tester) async {
      await tester.pumpWidget(buildProfileTest());
      await tester.pumpAndSettle();

      expect(find.byType(ProfileScreen), findsOneWidget);
    });

    testWidgets('menampilkan judul "My Profile" di AppBar', (tester) async {
      await tester.pumpWidget(buildProfileTest());
      await tester.pumpAndSettle();

      expect(find.text('My Profile'), findsWidgets);
    });

    testWidgets('menampilkan foto profil (CircleAvatar)', (tester) async {
      await tester.pumpWidget(buildProfileTest());
      await tester.pumpAndSettle();

      // Karena kita menggunakan nested CircleAvatar untuk border,
      // kita mengecek apakah widget tersebut ada di layar.
      expect(find.byType(CircleAvatar), findsWidgets);
    });

    testWidgets('menampilkan nama lengkap Anny Klaudya Hutabarat', (tester) async {
      await tester.pumpWidget(buildProfileTest());
      await tester.pumpAndSettle();

      expect(find.text('Anny Klaudya Hutabarat'), findsOneWidget);
    });

    testWidgets('menampilkan NIM 11S23019', (tester) async {
      await tester.pumpWidget(buildProfileTest());
      await tester.pumpAndSettle();

      expect(find.text('11S23019'), findsOneWidget);
    });

    testWidgets('menampilkan menu "Tentang Saya"', (tester) async {
      await tester.pumpWidget(buildProfileTest());
      await tester.pumpAndSettle();

      expect(find.text('Tentang Saya'), findsOneWidget);
    });

    testWidgets('menampilkan switch untuk ganti mode (Dark/Light)', (tester) async {
      await tester.pumpWidget(buildProfileTest());
      await tester.pumpAndSettle();

      // Memastikan widget Switch untuk toggle tema tersedia
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('halaman dapat di-scroll', (tester) async {
      await tester.pumpWidget(buildProfileTest());
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  });
}