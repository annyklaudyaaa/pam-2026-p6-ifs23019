// test/widget/top_app_bar_widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/app_theme.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/theme_notifier.dart';
import 'package:pam_p6_2026_ifs23019/shared/widgets/top_app_bar_widget.dart';

/// Helper untuk membungkus widget dengan semua provider yang dibutuhkan
Widget buildTestApp({required Widget child}) {
  final notifier = ThemeNotifier(initial: ThemeMode.light);
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (_, __) => child),
  ]);

  return ThemeProvider(
    notifier: notifier,
    child: MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
    ),
  );
}

void main() {
  group('TopAppBarWidget (Dessert Theme)', () {
    testWidgets('menampilkan judul dengan benar (Delcom Desserts)', (tester) async {
      await tester.pumpWidget(buildTestApp(
        child: const Scaffold(
          appBar: TopAppBarWidget(title: 'Delcom Desserts'),
          body: SizedBox(),
        ),
      ));

      expect(find.text('Delcom Desserts'), findsOneWidget);
    });

    testWidgets('tidak menampilkan tombol back secara default', (tester) async {
      await tester.pumpWidget(buildTestApp(
        child: const Scaffold(
          appBar: TopAppBarWidget(title: 'Home'),
          body: SizedBox(),
        ),
      ));

      expect(find.byIcon(Icons.arrow_back), findsNothing);
    });

    testWidgets('menampilkan tombol back saat showBackButton = true',
            (tester) async {
          await tester.pumpWidget(buildTestApp(
            child: const Scaffold(
              appBar: TopAppBarWidget(title: 'Detail', showBackButton: true),
              body: SizedBox(),
            ),
          ));

          expect(find.byIcon(Icons.arrow_back), findsOneWidget);
        });

    testWidgets('menampilkan tombol toggle mode (ikon bulan saat Light Mode)', (tester) async {
      await tester.pumpWidget(buildTestApp(
        child: const Scaffold(
          appBar: TopAppBarWidget(title: 'Home'),
          body: SizedBox(),
        ),
      ));

      // Dalam light mode, AppBar menampilkan ikon dark_mode_rounded untuk switch
      expect(find.byIcon(Icons.dark_mode_rounded), findsOneWidget);
    });

    testWidgets('tombol toggle mengubah ikon saat ditekan', (tester) async {
      await tester.pumpWidget(buildTestApp(
        child: const Scaffold(
          appBar: TopAppBarWidget(title: 'Home'),
          body: SizedBox(),
        ),
      ));

      // Awalnya light mode → tampil ikon dark_mode_rounded
      expect(find.byIcon(Icons.dark_mode_rounded), findsOneWidget);

      // Tekan tombol toggle
      await tester.tap(find.byIcon(Icons.dark_mode_rounded));
      await tester.pumpAndSettle();

      // Sekarang di dark mode → tampil ikon light_mode_rounded
      expect(find.byIcon(Icons.light_mode_rounded), findsOneWidget);
    });

    testWidgets('menampilkan tombol search saat withSearch = true',
            (tester) async {
          await tester.pumpWidget(buildTestApp(
            child: const Scaffold(
              appBar: TopAppBarWidget(title: 'Desserts', withSearch: true),
              body: SizedBox(),
            ),
          ));

          expect(find.byIcon(Icons.search), findsOneWidget);
        });

    testWidgets('menekan tombol search menampilkan TextField dengan hint dessert', (tester) async {
      await tester.pumpWidget(buildTestApp(
        child: const Scaffold(
          appBar: TopAppBarWidget(title: 'Desserts', withSearch: true),
          body: SizedBox(),
        ),
      ));

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Verifikasi TextField muncul
      expect(find.byType(TextField), findsOneWidget);
      // Verifikasi hint teks sudah berubah ke dessert
      expect(find.text('Cari dessert...'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('menekan tombol close menutup search dan mereset query',
            (tester) async {
          String query = '';

          await tester.pumpWidget(buildTestApp(
            child: Scaffold(
              appBar: TopAppBarWidget(
                title: 'Desserts',
                withSearch: true,
                onSearchQueryChange: (q) => query = q,
              ),
              body: const SizedBox(),
            ),
          ));

          // Buka search
          await tester.tap(find.byIcon(Icons.search));
          await tester.pumpAndSettle();

          // Ketik nama dessert
          await tester.enterText(find.byType(TextField), 'lava cake');
          await tester.pump();

          // Tutup search
          await tester.tap(find.byIcon(Icons.close));
          await tester.pumpAndSettle();

          // TextField harus hilang dan query string harus kosong lagi
          expect(find.byType(TextField), findsNothing);
          expect(query, equals(''));
        });

    testWidgets('tidak menampilkan tombol search secara default',
            (tester) async {
          await tester.pumpWidget(buildTestApp(
            child: const Scaffold(
              appBar: TopAppBarWidget(title: 'Profile'),
              body: SizedBox(),
            ),
          ));

          expect(find.byIcon(Icons.search), findsNothing);
        });
  });
}