// test/widget/bottom_nav_widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/app_theme.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/theme_notifier.dart';
import 'package:pam_p6_2026_ifs23019/shared/widgets/bottom_nav_widget.dart';

Widget buildNavTestApp(String initialRoute) {
  final notifier = ThemeNotifier(initial: ThemeMode.light);
  final router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      ShellRoute(
        builder: (context, state, child) =>
            Scaffold(body: child, bottomNavigationBar: BottomNavWidget(child: child)),
        routes: [
          GoRoute(path: '/', builder: (_, __) => const SizedBox(key: Key('home'))),
          // Update path dari /Desserts menjadi /desserts
          GoRoute(path: '/desserts', builder: (_, __) => const SizedBox(key: Key('desserts'))),
          GoRoute(path: '/profile', builder: (_, __) => const SizedBox(key: Key('profile'))),
        ],
      ),
    ],
  );

  return ThemeProvider(
    notifier: notifier,
    child: MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerConfig: router,
    ),
  );
}

void main() {
  group('BottomNavWidget (Dessert Theme)', () {
    testWidgets('merender tiga item navigasi dengan label yang benar', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Desserts'), findsOneWidget); // Berubah dari Desserts
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('menampilkan ikon home aktif di halaman home', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('menekan Desserts menavigasi ke halaman Desserts', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      // Tap tab Desserts
      await tester.tap(find.text('Desserts'));
      await tester.pumpAndSettle();

      // Memastikan widget dengan key 'desserts' dirender
      expect(find.byKey(const Key('desserts')), findsOneWidget);
    });

    testWidgets('menekan Profile menavigasi ke halaman Profile', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('profile')), findsOneWidget);
    });

    testWidgets('menampilkan NavigationBar sebagai komponen utama', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/'));
      await tester.pumpAndSettle();

      expect(find.byType(NavigationBar), findsOneWidget);
    });

    testWidgets('menampilkan ikon bakery_dining saat halaman desserts aktif', (tester) async {
      await tester.pumpWidget(buildNavTestApp('/desserts'));
      await tester.pumpAndSettle();

      // Memastikan ikon roti/kue (bakery_dining) muncul sebagai ikon aktif
      expect(find.byIcon(Icons.bakery_dining), findsOneWidget);
    });
  });
}