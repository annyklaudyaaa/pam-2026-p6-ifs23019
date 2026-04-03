// test/unit/dummy_data_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:pam_p6_2026_ifs23019/data/dummy_data.dart';
import 'package:pam_p6_2026_ifs23019/data/models/dessert_model.dart'; // Import model dessert

void main() {
  group('DummyData.getDessertsData()', () {
    late List<DessertModel> desserts;

    setUp(() {
      // Mengambil data dessert dari DummyData
      desserts = DummyData.getDessertsData();
    });

    test('mengembalikan list yang tidak kosong', () {
      expect(desserts, isNotEmpty);
    });

    test('mengembalikan minimal 10 dessert', () {
      // Kita sudah membuat 10 data dessert di dummy_data.dart
      expect(desserts.length, greaterThanOrEqualTo(10));
    });

    test('semua dessert memiliki nama yang tidak kosong', () {
      for (final dessert in desserts) {
        expect(dessert.nama, isNotEmpty,
            reason: 'Nama tidak boleh kosong untuk: ${dessert.nama}');
      }
    });

    test('semua dessert memiliki path gambar yang valid', () {
      for (final dessert in desserts) {
        expect(dessert.gambar, startsWith('assets/images/'),
            reason: 'Path gambar tidak valid untuk: ${dessert.nama}');
        expect(dessert.gambar, endsWith('.png'),
            reason: 'Gambar harus berformat .png untuk: ${dessert.nama}');
      }
    });

    test('semua dessert memiliki deskripsi yang tidak kosong', () {
      for (final dessert in desserts) {
        expect(dessert.deskripsi, isNotEmpty,
            reason: 'Deskripsi kosong untuk: ${dessert.nama}');
      }
    });

    test('tidak ada nama dessert yang duplikat', () {
      final namaList = desserts.map((d) => d.nama).toList();
      final namaSet = namaList.toSet();
      expect(namaSet.length, equals(namaList.length),
          reason: 'Ditemukan nama dessert yang duplikat');
    });

    test('data "Chocolate Lava Cake" terdapat dalam list', () {
      final lavaCake = desserts.where((d) => d.nama == 'Chocolate Lava Cake').firstOrNull;
      expect(lavaCake, isNotNull);
      expect(lavaCake!.gambar, contains('lava_cake'));
    });

    test('filter pencarian berdasarkan kata "Cake" bekerja dengan benar', () {
      final hasil = desserts
          .where((d) => d.nama.toLowerCase().contains('cake'))
          .toList();
      // Menemukan: Chocolate Lava Cake, Strawberry Cheesecake, Red Velvet Cake
      expect(hasil.length, equals(3));
    });

    test('memanggil getDessertsData dua kali menghasilkan data yang sama', () {
      final desserts2 = DummyData.getDessertsData();
      expect(desserts.length, equals(desserts2.length));
      for (int i = 0; i < desserts.length; i++) {
        expect(desserts[i].nama, equals(desserts2[i].nama));
      }
    });
  });
}