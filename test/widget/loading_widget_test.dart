// test/widget/loading_widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pam_p6_2026_ifs23019/shared/widgets/loading_widget.dart';

void main() {
  group('LoadingWidget (Dessert Animation)', () {
    testWidgets('merender tanpa error', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingWidget()),
        ),
      );

      // Verifikasi widget utama LoadingWidget ada di tree
      expect(find.byType(LoadingWidget), findsOneWidget);
    });

    testWidgets('menampilkan Stack sebagai container animasi ripple', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingWidget()),
        ),
      );

      // Pastikan ada Stack untuk menumpuk lingkaran ripple dan logo
      expect(find.byType(Stack), findsWidgets);
    });

    testWidgets('menampilkan gambar logo dessert di tengah', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingWidget()),
        ),
      );

      // Memastikan widget Image (untuk img_lava_cake) tersedia
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('widget berada di posisi tengah layar (Center)', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingWidget()),
        ),
      );

      // Memastikan animasi berada di tengah agar terlihat fokus
      expect(find.byType(Center), findsWidgets);
    });

    testWidgets('menjalankan animasi ripple secara berulang', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingWidget()),
        ),
      );

      // Memutar animasi selama 500ms
      await tester.pump(const Duration(milliseconds: 500));

      // Jika tidak ada error setelah pump, berarti AnimationController berjalan lancar
      expect(find.byType(AnimatedBuilder), findsWidgets);
    });
  });
}