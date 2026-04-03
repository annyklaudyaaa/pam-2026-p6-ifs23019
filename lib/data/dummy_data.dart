// lib/data/dummy_data.dart

import 'models/dessert_model.dart';

/// Kelas untuk menyimpan data statis (dummy) untuk tema Dessert
/// Menggunakan static method agar tidak perlu instansiasi
class DummyData {
  DummyData._();

  static List<DessertModel> getDessertsData() {
    return const [
      DessertModel(
        nama: 'Chocolate Lava Cake',
        gambar: 'assets/images/img_lava_cake.png',
        deskripsi: 'Kue cokelat panggang dengan tekstur lembut di luar dan lelehan cokelat hangat di bagian dalamnya.',
        komposisi: 'Cokelat hitam premium, mentega, telur, tepung terigu, dan bubuk kakao.',
        kalori: '350 kkal per porsi',
      ),
      DessertModel(
        nama: 'Strawberry Cheesecake',
        gambar: 'assets/images/img_strawberry_cheesecake.png',
        deskripsi: 'Cheesecake klasik yang lembut di atas lapisan biskuit renyah dengan topping saus stroberi segar.',
        komposisi: 'Krim keju, biskuit gandum, stroberi segar, gula, dan krim kental.',
        kalori: '320 kkal per potong',
      ),
      DessertModel(
        nama: 'Matcha Tiramisu',
        gambar: 'assets/images/img_matcha_tiramisu.png',
        deskripsi: 'Variasi tiramisu menggunakan bubuk matcha Jepang berkualitas tinggi yang memberikan rasa unik dan menenangkan.',
        komposisi: 'Bubuk matcha, biskuit ladyfinger, keju mascarpone, dan krim.',
        kalori: '290 kkal per porsi',
      ),
      DessertModel(
        nama: 'Red Velvet Cake',
        gambar: 'assets/images/img_red_velvet.png',
        deskripsi: 'Kue berwarna merah ikonik dengan tekstur beludru dan lapisan frosting krim keju yang gurih manis.',
        komposisi: 'Tepung terigu, buttermilk, bubuk cokelat, pewarna makanan merah, dan krim keju.',
        kalori: '380 kkal per potong',
      ),
      DessertModel(
        nama: 'Macarons Selection',
        gambar: 'assets/images/img_macarons.png',
        deskripsi: 'Kue kering mungil khas Prancis yang renyah di luar dan kenyal di dalam dengan berbagai isian rasa.',
        komposisi: 'Tepung almond, putih telur, gula halus, dan berbagai ganache rasa.',
        kalori: '80 kkal per keping',
      ),
      DessertModel(
        nama: 'Cinnamon Rolls',
        gambar: 'assets/images/img_cinnamon_rolls.png',
        deskripsi: 'Roti gulung kayu manis yang empuk, disajikan hangat dengan siraman gula cair (glaze) di atasnya.',
        komposisi: 'Adonan roti, bubuk kayu manis, gula cokelat (brown sugar), dan cream cheese glaze.',
        kalori: '300 kkal per buah',
      ),
      DessertModel(
        nama: 'Mango Panna Cotta',
        gambar: 'assets/images/img_panna_cotta.png',
        deskripsi: 'Puding krim khas Italia yang sangat lembut dengan siraman purée mangga arumanis yang segar.',
        komposisi: 'Krim, susu, gelatin, vanilla, dan buah mangga segar.',
        kalori: '250 kkal per porsi',
      ),
      DessertModel(
        nama: 'Churros with Chocolate',
        gambar: 'assets/images/img_churros.png',
        deskripsi: 'Camilan goreng khas Spanyol yang renyah, dibalut gula kayu manis dan disajikan dengan saus cokelat pekat.',
        komposisi: 'Adonan pasta, kayu manis, gula, dan saus cokelat celup.',
        kalori: '320 kkal per porsi',
      ),
      DessertModel(
        nama: 'Apple Pie',
        gambar: 'assets/images/img_apple_pie.png',
        deskripsi: 'Pai panggang tradisional berisi irisan apel malang yang dimasak dengan kayu manis di dalam kulit pai yang renyah.',
        komposisi: 'Apel, kulit pai (shortcrust pastry), kayu manis, dan mentega.',
        kalori: '280 kkal per potong',
      ),
      DessertModel(
        nama: 'Vanilla Gelato',
        gambar: 'assets/images/img_gelato.png',
        deskripsi: 'Es krim khas Italia yang lebih padat dan rendah lemak dibandingkan es krim biasa, dengan rasa vanilla alami.',
        komposisi: 'Susu, krim, gula, dan biji vanilla asli.',
        kalori: '210 kkal per cup',
      ),
    ];
  }
}