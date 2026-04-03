// test/integration/app_navigation_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Pastikan nama package sesuai dengan pubspec.yaml kamu
import 'package:pam_p6_2026_ifs23019/app.dart';

void main() {
  group('Navigasi Aplikasi Dessert (End-to-End)', () {
    testWidgets('aplikasi berjalan dan menampilkan HomeScreen', (tester) async {
      // Pastikan nama class aplikasi di app.dart sudah diganti (misal: DelcomDessertsApp)
      await tester.pumpWidget(const DelcomDessertsApp());
      await tester.pumpAndSettle();

      // Halaman awal adalah Home (Mengecek judul AppBar)
      expect(find.text('Delcom Desserts'), findsWidgets);
    });

    testWidgets('navigasi dari Home ke Desserts via BottomNav', (tester) async {
      await tester.pumpWidget(const DelcomDessertsApp());
      await tester.pumpAndSettle();

      // Tap tab Desserts di bottom nav
      await tester.tap(find.text('Desserts'));
      await tester.pumpAndSettle();

      // Halaman Desserts muncul
      expect(find.text('Dessert Menu'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('navigasi dari Home ke Profile via BottomNav', (tester) async {
      await tester.pumpWidget(const DelcomDessertsApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      // Mengecek apakah ada teks identitas di halaman profil
      expect(find.text('Anny Klaudya Hutabarat'), findsOneWidget);
      expect(find.text('Tentang Saya'), findsOneWidget);
    });

    testWidgets('toggle dark mode mengubah ikon di TopAppBar', (tester) async {
      await tester.pumpWidget(const DelcomDessertsApp());
      await tester.pumpAndSettle();

      // Awalnya light mode (ikon bulan untuk berpindah ke dark)
      expect(find.byIcon(Icons.dark_mode_rounded), findsOneWidget);

      // Klik tombol toggle
      await tester.tap(find.byIcon(Icons.dark_mode_rounded));
      await tester.pumpAndSettle();

      // Ikon berubah ke matahari (light mode)
      expect(find.byIcon(Icons.light_mode_rounded), findsOneWidget);
    });

    testWidgets('pencarian di halaman Desserts dapat menemukan menu',
            (tester) async {
          await tester.pumpWidget(const DelcomDessertsApp());
          await tester.pumpAndSettle();

          // Navigasi ke Desserts menggunakan Key yang sudah kita buat di BottomNav
          await tester.tap(find.byKey(const Key('Desserts')));
          await tester.pumpAndSettle();

          // Buka mode pencarian
          await tester.tap(find.byIcon(Icons.search));
          await tester.pumpAndSettle();

          // Ketik nama dessert (Contoh: Lava Cake)
          await tester.enterText(find.byType(TextField), 'Lava Cake');
          await tester.pumpAndSettle();

          // Hanya menu yang mengandung 'Lava Cake' yang tampil di list
          expect(
            find.descendant(
              of: find.byType(ListView),
              matching: find.textContaining('Lava Cake'),
            ),
            findsOneWidget,
          );
        });

    testWidgets('navigasi kembali ke Home dari Desserts menggunakan BottomNav',
            (tester) async {
          await tester.pumpWidget(const DelcomDessertsApp());
          await tester.pumpAndSettle();

          // Pergi ke halaman Desserts
          await tester.tap(find.text('Desserts'));
          await tester.pumpAndSettle();

          // Kembali ke halaman Home
          await tester.tap(find.text('Home'));
          await tester.pumpAndSettle();

          // Memastikan banner promo di Home muncul kembali
          expect(find.textContaining('Sweet Treats for You!'), findsOneWidget);
        });
  });
}