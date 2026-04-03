// lib/data/models/dessert_model.dart

/// Model data untuk Dessert
/// Menggunakan immutable class (best practice Flutter/Dart)
class DessertModel {
  const DessertModel({
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.komposisi, // Pengganti 'manfaat'
    required this.kalori,    // Pengganti 'efekSamping'
  });

  final String nama;
  final String gambar; // Path asset, contoh: 'assets/images/img_cake.png'
  final String deskripsi;
  final String komposisi;
  final String kalori;

  /// Metode copyWith memudahkan pembuatan objek baru dengan data yang diubah sebagian
  DessertModel copyWith({
    String? nama,
    String? gambar,
    String? deskripsi,
    String? komposisi,
    String? kalori,
  }) {
    return DessertModel(
      nama: nama ?? this.nama,
      gambar: gambar ?? this.gambar,
      deskripsi: deskripsi ?? this.deskripsi,
      komposisi: komposisi ?? this.komposisi,
      kalori: kalori ?? this.kalori,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DessertModel &&
              runtimeType == other.runtimeType &&
              nama == other.nama;

  @override
  int get hashCode => nama.hashCode;

  @override
  String toString() => 'DessertModel(nama: $nama)';
}