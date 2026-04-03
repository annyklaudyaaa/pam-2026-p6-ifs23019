// test/widget/screens/desserts_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/app_theme.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/theme_notifier.dart';
import 'package:pam_p6_2026_ifs23019/data/dummy_data.dart';
import 'package:pam_p6_2026_ifs23019/features/desserts/desserts_screen.dart';
import 'package:pam_p6_2026_ifs23019/features/plants/desserts_screen.dart';

Widget buildDessertsTest() {
  final notifier = ThemeNotifier(initial: ThemeMode.light);
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (_, _) => const DessertsScreen()),
    // Route untuk detail (menggunakan path parameter :name)
    GoRoute(path: '/desserts/:name', builder: (_, _) => const SizedBox()),
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
  group('DessertsScreen (Widget Test)', () {
    testWidgets('merender tanpa error', (tester) async {
      await tester.pumpWidget(buildDessertsTest());
      await tester.pumpAndSettle();

      expect(find.byType(DessertsScreen), findsOneWidget);
    });

    testWidgets('menampilkan judul "Dessert Menu" di AppBar', (tester) async {
      await tester.pumpWidget(buildDessertsTest());
      await tester.pumpAndSettle();

      expect(find.text('Dessert Menu'), findsOneWidget);
    });

    testWidgets('menampilkan tombol search di AppBar', (tester) async {
      await tester.pumpWidget(buildDessertsTest());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('menampilkan data dessert dari DummyData', (tester) async {
      await tester.pumpWidget(buildDessertsTest());
      await tester.pumpAndSettle();

      final desserts = DummyData.getDessertsData();
      // Memastikan nama dessert pertama (misal: Chocolate Lava Cake) tampil
      expect(find.text(desserts.first.nama), findsOneWidget);
    });

    testWidgets('menampilkan list menggunakan ListView', (tester) async {
      await tester.pumpWidget(buildDessertsTest());
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('fungsi search memfilter dessert berdasarkan nama',
            (tester) async {
          await tester.pumpWidget(buildDessertsTest());
          await tester.pumpAndSettle();

          // Klik tombol search
          await tester.tap(find.byIcon(Icons.search));
          await tester.pumpAndSettle();

          // Ketik query pencarian
          await tester.enterText(find.byType(TextField), 'Matcha');
          await tester.pumpAndSettle();

          // Hanya Matcha Tiramisu (atau yang mengandung 'Matcha') yang tampil
          expect(find.textContaining('Matcha'), findsWidgets);
          // Nama lain (seperti Strawberry Cheesecake) tidak boleh tampil
          expect(find.text('Strawberry Cheesecake'), findsNothing);
        });

    testWidgets('menampilkan pesan saat tidak ada hasil pencarian',
            (tester) async {
          await tester.pumpWidget(buildDessertsTest());
          await tester.pumpAndSettle();

          await tester.tap(find.byIcon(Icons.search));
          await tester.pumpAndSettle();

          // Masukkan teks acak yang tidak ada di data
          await tester.enterText(find.byType(TextField), 'xyz123abc');
          await tester.pumpAndSettle();

          // Menyesuaikan dengan teks empty state di DessertsScreen
          expect(find.text('Menu tidak ditemukan...'), findsOneWidget);
        });

    testWidgets('menutup search mereset daftar dessert', (tester) async {
      await tester.pumpWidget(buildDessertsTest());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Matcha');
      await tester.pumpAndSettle();

      // Klik tombol close (X) di search bar
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Scroll untuk memastikan data terakhir kembali muncul
      final lastDessert = DummyData.getDessertsData().last;
      await tester.scrollUntilVisible(
        find.text(lastDessert.nama),
        500,
      );

      expect(find.text(lastDessert.nama), findsOneWidget);
    });
  });
}