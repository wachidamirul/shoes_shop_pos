# Shoes Shop POS

Aplikasi Point of Sale (POS) untuk toko sepatu berbasis Flutter. Mendukung manajemen produk, kategori, keranjang,
checkout, analitik penjualan, serta autentikasi pengguna.

## Fitur Utama

- **Manajemen Produk**: Tambah, edit, dan hapus produk beserta variasi ukuran dan stok.
- **Kategori Produk**: Pengelompokan produk berdasarkan kategori.
- **Keranjang Belanja**: Tambah produk ke keranjang dan lakukan checkout.
- **Analitik Penjualan**: Lihat statistik penjualan dan produk terlaris.
- **Autentikasi**: Login, register, dan social login (Google, Facebook).
- **Scan Barcode/QR**: Mendukung pemindaian barcode/QR untuk produk.
- **Tema Gelap/Terang**: Pilihan mode tema aplikasi.
- **Responsive**: Mendukung berbagai ukuran layar.

## Struktur Folder

<!-- TREEVIEW START -->

```bash
├── app/            # Folder utama aplikasi
│   ├── data/
│   ├── modules/    # Modul fitur (login, register, home, carts, product, dll)
│   ├── routes/     # Routing aplikasi
│   ├── services/   # Service untuk API, autentikasi, dll
│   ├── utils/      # Utility, helper, constants, theme, dll
│   └── widgets/    # Widget custom reusable
├── assets/         # Gambar, ikon, lottie, dll
```

<!-- TREEVIEW END -->

## Konfigurasi Awal

1. **Clone repository**

   ```sh
   git clone https://github.com/wachidamirul/shoes_shop_pos
   cd shoes_shop_pos
   ```

2. **Install dependencies**

   ```sh
   flutter pub get
   ```

3. **Setup file environment**

   - Buat file `.env` di root project, contoh:
     ```
     SUPABASE_URL=your_supabase_url
     SUPABASE_KEY=your_supabase_key
     GOOGLE_WEB_CLIENT_ID=your_google_web_client_id
     GOOGLE_IOS_CLIENT_ID=your_google_ios_client_id
     GOOGLE_ANDROID_CLIENT_ID=your_google_android_client_id
     ```

4. **Jalankan aplikasi**
   ```sh
   flutter run
   ```

## Dependensi Utama

- [GetX](https://pub.dev/packages/get)
- [Supabase](https://pub.dev/packages/supabase_flutter)
- [GetStorage](https://pub.dev/packages/get_storage)
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- [animated_bottom_navigation_bar](https://pub.dev/packages/animated_bottom_navigation_bar)
- [simple_barcode_scanner](https://pub.dev/packages/simple_barcode_scanner)
- [intl](https://pub.dev/packages/intl)
- [lottie](https://pub.dev/packages/lottie)
- [iconsax](https://pub.dev/packages/iconsax)

## Kontribusi

Pull request dan issue sangat diterima! Silakan fork repo ini dan ajukan perubahan.

## Lisensi

MIT License

---

> Dibuat untuk tugas UAS Pemrograman Mobile.
