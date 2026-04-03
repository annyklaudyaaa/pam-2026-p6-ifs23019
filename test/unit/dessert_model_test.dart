// test/unit/dessert_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:pam_p6_2026_ifs23019/data/models/dessert_model.dart';

void main() {
  group('DessertModel (Unit Test)', () {
    // Objek dummy untuk pengujian
    const dessert = DessertModel(
      nama: 'Lava Cake',
      gambar: 'assets/images/img_lava_cake.png',
      deskripsi: 'Kue cokelat leleh.',
      komposisi: 'Cokelat, tepung, telur.',
      kalori: '350 kkal',
    );

    test('membuat objek dengan semua field yang benar', () {
      expect(dessert.nama, equals('Lava Cake'));
      expect(dessert.gambar, equals('assets/images/img_lava_cake.png'));
      expect(dessert.deskripsi, equals('Kue cokelat leleh.'));
      expect(dessert.komposisi, equals('Cokelat, tepung, telur.'));
      expect(dessert.kalori, equals('350 kkal'));
    });

    test('copyWith mengubah hanya field yang diberikan', () {
      // Mengubah nama, field lain harus tetap sama
      final updated = dessert.copyWith(nama: 'Red Velvet');
      expect(updated.nama, equals('Red Velvet'));

      // Field lain tetap menggunakan nilai dari objek awal
      expect(updated.gambar, equals(dessert.gambar));
      expect(updated.deskripsi, equals(dessert.deskripsi));
      expect(updated.komposisi, equals(dessert.komposisi));
      expect(updated.kalori, equals(dessert.kalori));
    });

    test('copyWith tanpa argumen menghasilkan objek yang identik secara data', () {
      final copy = dessert.copyWith();
      expect(copy.nama, equals(dessert.nama));
      expect(copy.gambar, equals(dessert.gambar));
      expect(copy.kalori, equals(dessert.kalori));
    });

    test('dua objek dengan nama sama dianggap equal (berdasarkan override ==)', () {
      const other = DessertModel(
        nama: 'Lava Cake', // Nama sama
        gambar: 'assets/images/img_beda.png', // Field lain beda
        deskripsi: 'Deskripsi berbeda.',
        komposisi: '-',
        kalori: '-',
      );
      // Karena kita meng-override operator == di model, ini akan bernilai true
      expect(dessert, equals(other));
    });

    test('dua objek dengan nama berbeda tidak dianggap equal', () {
      const other = DessertModel(
        nama: 'Donut',
        gambar: 'assets/images/img_lava_cake.png',
        deskripsi: 'Kue cokelat leleh.',
        komposisi: 'Cokelat, tepung, telur.',
        kalori: '350 kkal',
      );
      expect(dessert, isNot(equals(other)));
    });

    test('hashCode konsisten dengan equality', () {
      const same = DessertModel(
        nama: 'Lava Cake',
        gambar: '-',
        deskripsi: '-',
        komposisi: '-',
        kalori: '-',
      );
      // Karena nama sama, hashCode-nya juga harus sama
      expect(dessert.hashCode, equals(same.hashCode));
    });

    test('toString menampilkan nama dessert', () {
      expect(dessert.toString(), contains('Lava Cake'));
    });
  });
}