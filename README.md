Nama    : Caesar Syahru Ramadhan

NPM     : 2206819092 

Kelas   : PBP C

berikut adalah link tugas:

[Tugas 7](#Tugas-7)

# Tugas 7

## Implementasi Checklist

1. Pergi ke direktori di mana aplikasi ini ingin dibuat, lalu buka command prompt pada direktori tersebut.
2. Buat proyek Flutter baru dengan nama `crimson_chest_mobile` dengan menggunakan command berikut.
```
flutter create inventory_app_mobile
cd inventory_app_mobile
```

3. Buat file baru dengan nama `menu.dart` pada folder lib, lalu tambahkan baris import berikut.
```dart
import 'package:flutter/material.dart';
```

4. Pindahkan kode pada file `main.dart` pada bagian class `MyHomePage` dan `_MyHomePage` ke file `menu.dart`.
5. Tambahkan baris import ini ke file `main.dart` agar class `MyHomePage` tetap bisa digunakan di file `main.dart`.
```dart
import 'package:inventory_app_mobile/menu.dart';
```

6. Mengubah sifat widget MyHomePage menjadi stateless dengan mengubah kode pada class MyHomePage menjadi seperti di bawah ini
```dart
 class MyHomePage extends StatelessWidget {
     MyHomePage({Key? key}) : super(key: key);

     @override
     Widget build(BuildContext context) {
         return Scaffold(
             ...
         )
     }
 }
```

7. Mengubah baris kode `MyHomePage(title: 'Flutter Demo Home Page')` pada file `main.dart` menjadi 
```dart
MyHomePage()
```

8. Membuat class `Item`.
```dart
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;
  ShopItem(this.name, this.icon, this.color);
}
```

9. Tambahkan baris kode berikut untuk menambahkan item-item yang akan dibuat di bawah constructor pada class `MyHomePage`.
```dart
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.purple),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.cyan),
    ShopItem("Logout", Icons.logout, Colors.lightBlue),
  ];
```

10. Tambahkan kode berikut di dalam `Widget build` pada class `MyHomePage`
```dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Crimson Chest',
          style: TextStyle(color: Color.fromARGB(255, 95, 196, 95)),
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Main Menu', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
```

11. Buat stateless widget `ItemCard` untuk menampilkan card
```dart
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

12. Menghapus class `_MyHomePage` karena widget MyHomePage sudah berubah menjadi stateless sehingga class `_MyHomePage` tidak dibutuhkan.

## perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter

1. Stateless Widget:
   1. Tidak mempertahankan keadaan: Stateless widget tidak dapat mengubah keadaan sendiri karena tidak menyimpan informasi apapun yang mungkin berubah selama masa pakai widget.
   2. Build hanya sekali: Widget hanya dibangun sekali, dan harus dibangun ulang melalui external triggers jika data yang ditampilkan perlu diperbarui.
   3. Penggunaan: Digunakan untuk UI yang sederhana dan statis, seperti layout dan display text yang tidak berubah.
   
2. Stateful Widget:
   1. Memelihara keadaan: Stateful widget dapat mempertahankan keadaan yang mungkin berubah selama masa pakai widget.
   2. Bisa dibangun ulang: Widget ini dapat dibangun ulang ketika keadaan internalnya berubah, memungkinkan UI untuk memperbarui secara dinamis.
   3. Penggunaan: Digunakan untuk UI yang interaktif dan dinamis, seperti form input, animasi, atau apapun yang memerlukan pembaruan UI berdasarkan interaksi pengguna atau data yang berubah.

## Seluruh widget yang digunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing

1. `MaterialApp`: Widget kenyamanan yang membungkus sejumlah widget yang umumnya diperlukan untuk Material Design applications
2. `ThemeData`: Widget untuk memanipulasi tema seluruh aplikasi yang dibuat.
3. `ColorScheme`: Widget yang berisi satu set 30 warna berdasarkan spesifikasi Material yang dapat digunakan untuk mengonfigurasi properti warna sebagian besar komponen.
4. `Scaffold`: Widget berupa kelas dalam flutter yang menyediakan banyak widget atau bisa dikatakan API seperti Drawer, Snack-Bar, Bottom-Navigation-Bar, Floating-Action-Button, App-Bar, dll. Scaffold akan memperluas atau menempati seluruh layar perangkat. Ini akan menempati ruang yang tersedia.
5. `AppBar`: Widget yang biasanya merupakan komponen paling atas dari aplikasi (atau terkadang paling bawah), berisi toolbar dan beberapa tombol aksi umum lainnya.
6. `Text`: Text widget menampilkan serangkaian teks dengan single-style. String dapat dipecah menjadi beberapa baris atau mungkin semuanya ditampilkan pada baris yang sama, tergantung pada batasan tata letak. Argumen gaya bersifat opsional.
7. `Padding`: Widget yang menambahkan lapisan atau ruang kosong di sekitar widget atau sekelompok widget.
8. `Column`: Widget yang digunakan untuk membuat tata letak vertikal.
9. `GridView.count`: Widget yang membuat tata letak dengan jumlah tile tetap pada sumbu silang
10. `Material`: Widget yang berfungsi untuk menyediakan desain visual Material Design pada widget lain.
11. `InkWell`: Widget berupa area persegi panjang widget Material yang merespons peristiwa sentuhan dengan menampilkan percikan yang terpotong.
12. `Container`: Kelas widget yang memungkinkan untuk menyesuaikan widget turunannya.
13. `Icon`: Widget yang berfungsi untuk menampilkan beragam ikon dengan aneka model dan ukuran.
14. `SnackBar`: Widget berupa pesan ringan dengan tindakan opsional yang ditampilkan secara singkat di bagian bawah layar.