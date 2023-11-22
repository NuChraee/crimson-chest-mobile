Nama    : Caesar Syahru Ramadhan

NPM     : 2206819092 

Kelas   : PBP C

berikut adalah link tugas:

[Tugas 7](#Tugas-7)

[Tugas 8](#Tugas-8)

[Tugas 9](#Tugas-9)

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

# Tugas 8

## Implementasi Checklist

1. Buka proyek yang sebelumnya telah dibuat pada tugas 7
2. Buatlah file baru di dalam folder baru `widgets` dengan nama `left_drawer.dart`. sesuaikan kode dengan kebutuhan dan masukkan kode tersebut ke dalam file `left_drawer.dart`.
```dart
import 'package:flutter/material.dart';
import 'package:crimson_chest_mobile/screens/menu.dart';
import 'package:crimson_chest_mobile/screens/item_form.dart';
import 'package:crimson_chest_mobile/screens/item_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Inventory App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Create and manage your items from here!",
                  // Menambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          // Routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Show Items'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemsPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Items'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              Routing ke ShopFormPage di sini, setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ItemFormPage()));
            },
          ),
        ],
      ),
    );
  }
}
```

3. Sesuaikan kode pada `menu_card.dart` dan letakan `menu_card.dart` di folder `widgets` sesuai dengan keinginan kita, seperti pada kode dibawah ini
```dart
import 'package:flutter/material.dart';
import 'package:crimson_chest_mobile/screens/item_form.dart';
import 'package:crimson_chest_mobile/screens/item_list.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class Item {
  final String name;
  final String category;
  final int amount;
  final String modifiers;
  final int price;
  final String description;

  Item({
    required this.name,
    required this.category,
    required this.amount,
    required this.modifiers,
    required this.price,
    required this.description,
  });
}

class MenuCard extends StatelessWidget {
  final ShopItem item;

  const MenuCard(this.item, {super.key}); // Constructor

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

          if (item.name == "Show Items") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemsPage(),
                ));
          }

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Add Items") {
            // Melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ItemFormPage(),
              ),
            );
          }
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
   
4. Sesuaikan kode pada `menu.dart` agar sesuai dengan keinginan kita, seperti pada kode dibawah ini
```dart
import 'package:crimson_chest_mobile/widgets/left_drawer.dart';
import 'package:crimson_chest_mobile/widgets/menu_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Show Items", Icons.checklist, Colors.purple),
    ShopItem("Add Items", Icons.add_shopping_cart, Colors.cyan),
    ShopItem("Logout", Icons.logout, Colors.lightBlue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Inventory Management System',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
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
                  'Welcome to Crimson Chest Mobile', // Text yang menandakan toko
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
                  return MenuCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

5. Sesuaikan kode pada `item_form.dart` agar sesuai dengan keinginan kita, seperti pada kode dibawah ini
```dart
import 'package:flutter/material.dart';
import 'package:crimson_chest_mobile/widgets/left_drawer.dart';
import 'package:crimson_chest_mobile/widgets/menu_card.dart';

class ItemFormPage extends StatefulWidget {
  const ItemFormPage({super.key});

  @override
  State<ItemFormPage> createState() => _ItemFormPageState();
}

List<Item> items = [];

class _ItemFormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _category = "";
  int _amount = 0;
  String _modifiers = "";
  int _price = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Your Item',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      // Menambahkan drawer yang sudah dibuat di sini
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Item Name",
                  labelText: "Item Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    // Menambahkan variabel yang sesuai
                    _name = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Name cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Category",
                  labelText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _category = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    // Menambahkan variabel yang sesuai
                    _category = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Category cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Amount",
                  labelText: "Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _amount = int.parse(value!);
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Amount cannot be empty!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Amount must be a valid integer!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Modifiers",
                  labelText: "Modifiers",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    // Menambahkan variabel yang sesuai
                    _modifiers = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    // Menambahkan variabel yang sesuai
                    _modifiers = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Description cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Price",
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _price = int.parse(value!);
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Price cannot be empty!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Price must be a valid integer!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    // Menambahkan variabel yang sesuai
                    _description = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    // Menambahkan variabel yang sesuai
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Description cannot be empty!";
                  }
                  return null;
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      items.add(Item(
                        name: _name,
                        category: _category,
                        amount: _amount,
                        modifiers: _modifiers,
                        price: _price,
                        description: _description,
                      ));
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Item saved successfully'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Memunculkan value-value lainnya
                                  Text('Name: $_name'),
                                  Text('Category: $_category'),
                                  Text('Amount: $_amount'),
                                  Text('Modifiers: $_modifiers'),
                                  Text('Price: $_price Gold'),
                                  Text('Description: $_description')
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
```
6. Buat folder baru di dalam folder `lib` dengan nama `screens` lalu pindahkan file `menu.dart` dan `item_form.dart` ke dalam folder `screens`, serta lakukan refactoring

7. buat file baru di folder `screens` dengan nama `item_list.dart` untuk menampilkan list item yang sudah kita tambahkan, lalu isi file tersebut dengan kode ini
```dart
import 'package:crimson_chest_mobile/widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:crimson_chest_mobile/widgets/left_drawer.dart';
import 'package:crimson_chest_mobile/screens/item_form.dart';

// Assuming 'items' is a list of 'Item' objects as defined in your code

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items Gallery'),
        backgroundColor: Colors.green, // Consider using a Theme for consistency
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      drawer: const LeftDrawer(), // Consistent drawer usage
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          crossAxisSpacing: 10, // Horizontal spacing
          mainAxisSpacing: 10, // Vertical spacing
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemTile(
              item: item, onTap: () => _showModalBottomSheet(context, item));
        },
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context, Item item) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(item.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Category: ${item.category}"),
              Text("Amount: ${item.amount}"),
              Text("Price: ${item.price} Gold"),
              Text("Modifiers: ${item.modifiers}"),
              Text("Description: ${item.description}"),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ItemTile extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemTile({Key? key, required this.item, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory,
                size: 50, color: Colors.green), // Consider using dynamic icons
            Text(
              item.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            Text("${item.price} Gold"),
          ],
        ),
      ),
    );
  }
}

```

## Mengarahkan tombol Add Product ke form pada halaman utama

1. Untuk mengarahkan tombol Add Product ke form pada halaman utama, gunakan kode navigator.push di dalam class `MenuCard` pada file `menu_card.dart`
```dart
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

          if (item.name == "Show Items") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemsPage(),
                ));
          }

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Add Items") {
            // Melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ItemFormPage(),
              ),
            );
          }
        },
      ))},
```

## Memunculkan pop-up data sesuai dengan isi form setelah menekan tombol Save di dalam form

1. Menambahkan `showdialog` di dalam `function onPressed` pada Align tombol save di dalam file `item_form.dart`:
```dart
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.indigo),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          items.add(Item(
            name: _name,
            category: _category,
            amount: _amount,
            modifiers: _modifiers,
            price: _price,
            description: _description,
          ));
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Item saved successfully'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Memunculkan value-value lainnya
                      Text('Name: $_name'),
                      Text('Category: $_category'),
                      Text('Amount: $_amount'),
                      Text('Modifiers: $_modifiers'),
                      Text('Price: $_price Gold'),
                      Text('Description: $_description')
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
          _formKey.currentState!.reset();
        }
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
```

## Membuat sebuah drawer yang berisi routing ke Main Page, Add Product, dan Show Product

1. Pada file `left_drawer.dart` buat kode routing ke setiap page 
   1. Main Page
      ```dart
      // Routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
      ```

   2. Add Product
      ```dart
      ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Items'),
            // Bagian redirection ke ItemFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ItemFormPage()));
            },
          ),
      ``` 

   3. Show Product
      ```dart
      ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Show Items'),
            // Bagian redirection ke Item Page
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemsPage(),
                  ));
            },
          ),
      ```

## Perbedaan antara Navigator.push() dan Navigator.pushReplacement() di Flutter

1. Navigator.push():
   1. Fungsi ini digunakan untuk menavigasi ke halaman baru di atas tumpukan navigasi saat ini.
   2. Halaman baru ditambahkan ke tumpukan, dan pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol kembali.
   3. Contoh Penggunaan: Ketika Anda ingin membawa pengguna ke halaman detail tanpa menghilangkan halaman sebelumnya. Misalnya, dari daftar produk ke detail produk.
   
2. Navigator.pushReplacement():
   1. Fungsi ini juga digunakan untuk menavigasi ke halaman baru, tetapi menggantikan halaman saat ini di tumpukan navigasi.
   2. Halaman sebelumnya dihapus dari tumpukan, sehingga pengguna tidak bisa kembali ke halaman tersebut dengan tombol kembali.
   
3. Contoh Penggunaan: Ketika Anda ingin mengganti halaman login dengan halaman beranda setelah pengguna berhasil masuk, dan Anda tidak ingin pengguna kembali ke halaman login dengan menekan tombol kembali.
   
## Layout Widget pada Flutter dan Konteks Penggunaannya

1. Column dan Row:
   1. Digunakan untuk menata widget secara vertikal (Column) dan horizontal (Row).
   2. Cocok untuk membuat tata letak yang linear.

2. Stack:
   1. Menumpuk widget di atas satu sama lain.
   2. Baik untuk membuat tata letak overlay, seperti teks di atas gambar.

3. GridView:
   1. Menampilkan widget dalam grid.
   2. Ideal untuk galeri gambar atau grid item yang serupa.

4. ListView:
   1. Menampilkan daftar item yang dapat di-scroll.
   2. Cocok untuk daftar yang panjang dan dinamis.

5. Padding dan Container:
   1. Padding untuk memberikan ruang di sekitar widget.
   2. Container untuk lebih banyak kontrol layout, seperti ukuran, pewarnaan, dan lainnya.

## Elemen Input pada Form

1. TextField:
   1. Untuk input teks.
   2. Digunakan karena fleksibel untuk berbagai jenis input teks.


## Penerapan Clean Architecture pada Aplikasi Flutter

1. Pemisahan Layer:
   1. Presentation Layer: Mengelola UI dan interaksi pengguna.
   2. Business Logic Layer: Mengatur aturan bisnis dan keadaan aplikasi.
   3. Data Layer: Mengelola akses data (API, database lokal).

2. Penggunaan Model:
   1. Model digunakan untuk representasi data. Model tersebut harus sederhana dan hanya mencerminkan struktur data.

3. Dependency Injection:
   1. Memisahkan ketergantungan antar komponen, memudahkan pengujian dan pemeliharaan.

4. Testing:
   1. Setiap layer harus dapat diuji secara independen, memudahkan deteksi dan perbaikan bug.

5. Prinsip SOLID:
   1. Menerapkan prinsip SOLID untuk memastikan keterbacaan, pemeliharaan, dan skalabilitas kode.

Penerapan clean architecture di Flutter membantu dalam membuat kode yang lebih terstruktur, mudah diuji, dan mudah untuk dikembangkan lebih lanjut.


# Tugas 9: 

Integrasi Layanan Web Django dengan Aplikasi Flutter**
Mengintegrasikan layanan Django yang sudah dibuat pada tugas-tugas sebelumnya dengan aplikasi Flutter dan menerapkan beberapa konsep yang telah dipelajari di kelas serta menjawab beberapa pertanyaan.

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Ini bisa dilakukan dengan langsung mem-parsing data JSON ke dalam struktur data seperti dictionary atau array, tergantung pada struktur data JSON itu sendiri.

Namun, apakah ini lebih baik daripada membuat model terlebih dahulu? Jawabannya tergantung pada konteks dan kebutuhan aplikasi kta. Berikut adalah beberapa pertimbangan:
1. Keuntungan menggunakan model
    - Validasi data: Model dapat membantu dalam validasi data. Misalnya, jika kita tahu bahwa suatu nilai harus berupa integer dan model kita mencerminkan hal ini, maka jika data JSON berisi nilai non-integer untuk bidang ini, kesalahan akan terjadi saat parsing.
    - Ease of Use: Dengan model, kita dapat mengakses data menggunakan properti objek, yang bisa lebih intuitif dan mudah dibaca daripada mengakses nilai melalui kunci dictionary.
    - Dokumentasi dan struktur: Model memberikan struktur yang jelas untuk data kita, yang bisa sangat membantu dalam dokumentasi dan pemahaman data.
2. Keuntungan tidak menggunakan model
    - Fleksibilitas: Jika struktur data JSON sangat dinamis dan berubah-ubah, mungkin lebih mudah untuk bekerja dengan dictionary atau array daripada mencoba menyesuaikan model kita setiap kali struktur berubah.
    - Kecepatan pengembangan: Dalam beberapa kasus, mungkin lebih cepat dan lebih mudah untuk mulai bekerja dengan data tanpa menghabiskan waktu untuk mendefinisikan model terlebih dahulu.

Secara umum, jika kita bekerja dengan API atau data JSON yang memiliki struktur yang konsisten dan kita ingin memanfaatkan keuntungan dari model, maka pendekatan berbasis model mungkin lebih baik. Jika kita memerlukan fleksibilitas atau kecepatan, mungkin lebih baik bekerja langsung dengan data JSON. kita harus mempertimbangkan trade-off ini dalam konteks proyek kita sendiri.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah sebuah kelas yang digunakan untuk mengelola HTTP request dan cookie yang terkait dengan request tersebut. Kelas ini memiliki beberapa method untuk melakukan operasi seperti `login`, `get`, `post`, dan `logout`.

_Instance_ `CookieRequest` perlu dibagikan ke semua komponen di aplikasi Flutter agar semua komponen dalam aplikasi dapat melakukan HTTP request yang terotentikasi dan semua komponen akan memiliki akses ke data pengguna yang sama. 

Misalnya, pada tugas kali ini, _Instance_ `CookieRequest` dibagikan ke semua komponen melalui `Provider` dan diakses di `ItemFormPage` dengan `context.watch<CookieRequest>()` untuk melakukan permintaan HTTP POST ke server untuk mengirimkan data buku baru ke server saat tombol "save" ditekan.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Berikut adalah mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada tugas kali ini.

1. Fungsi `fetchProduct` membuat permintaan HTTP GET ke URL yang ditentukan. Ini dilakukan secara asinkron menggunakan `http.get`.
    ```dart
    var url = Uri.parse('http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );
    ```

2. Respons dari server kemudian di-_decode_ menjadi bentuk JSON menggunakan `jsonDecode`.
    ```dart
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    ```

3. Data JSON kemudian di-_convert_ menjadi objek `Product` menggunakan method `formJson` yang didefinisikan dalam kelas `Product` yang kemudian objek-objek tersebut ditambahkan ke dalam `listProduct`.
    ```dart
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    ```


## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Berikut adalah mekanisme autentikasi pada tugas kali ini.

1. Pengguna memasukkan _username_ dan _password_ melalui dua `TextField`.

2. Aplikasi kemudian membuat permintaan HTTP POST ke _endpoint_ _login_ Django menggunakan `CookieRequest`. Data _username_ dan _password_ dikirimkan sebagai bagian dari _body request_.
    ```dart
    final response = await request.login(
        "http://127.0.0.1:8000/auth/login/",  
        {
            'username': username,
            'password': password,
        });
    ```

3. Django memproses permintaan login, memeriksa apakah _username_ dan _password_ valid, dan mengirimkan respons. Respons ini kemudian diterima oleh aplikasi Flutter dan Flutter dan diperiksa. Jika login berhasil (`request.loggedIn` adalah `true`), aplikasi navigasi ke `MyHomePage` dan menampilkan pesan selamat datang. Jika login gagal, aplikasi menampilkan pesan kesalahan.

## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
- `AlertDialog` : untuk menampilkan dialog peringatan atau pesan ke pengguna.
- `TextButton` : untuk menampilkan tombol dengan teks.
- `TextField` : untuk menerima input teks dari pengguna.
- `InputDecoration` : untuk mendefinisikan penampilan dan gaya dari `TextField`.
- `SizedBox` : untuk memberikan jarak antara dua widget.
- `ElevatedButton` : untuk menampilkan tombol.
- `Navigator` : untuk mengelola stack rute dalam aplikasi.
- `MaterialPageRoute` : untuk menyediakan efek transisi saat berpindah antar halaman.
- `FloatingActionButton` : untuk menampilkan tombol aksi yang mengambang, pada tugas ini digunakan untuk tombol kembali.
- `CircularProgressIndicator` : untuk menampilkan indikator loading.
- `ListView.builder` : untuk membuat list yang efisien dengan item yang di-_build_ saat mereka diputar ke dalam tampilan.
- `GestureDetector` : untuk mendeteksi gestur, pada tugas ini digunakan untuk mendeteksi ketuka pada item `ListView`.
- `FutureBuilder` : untuk membuat widget berdasarkan hasil Future, pada tugas ini dugunakan untuk membangun `ListView` berdasarkan hasil dari `fetchProduct()`.
- `Provider` : untuk menyediakan objek yang dapat dibaca oleh widget lain yang berada di bawahnya di widget tree, pada tugas ini digunakan untuk menyediakan _instance_ `CookieRequest` ke widget lain.
- `LoginPage` : widget kustom untuk menampilkan halaman login.
- `ItemsPage` : widget kustom umtuk menampilkan halaman semua barang.
- `DetailItemPage` : widget kustom untuk menampilkan halaman detail barang.
- `ScaffoldMessenger` : untuk menampilkan `SnackBar`.

## Implementasi Checklist Tugas 9

### 1. Memastikan deployment proyek tugas Django sebelumnya telah berjalan dengan baik.
Melakukan _push_ ulang dengan memberikan sedikit perbedaan pada kode aplikasi untuk mengatasi masalah _blue screen_ saat membuka _web app_.

### 2. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
- Membuat `django-app` baru bernama `authentication` dan menambahkannya ke `INSTALLED_APPS` di `settings.py` aplikasi Django.
- Menginstall `django-cors-headers` dan menambahkannya ke `INSTALLED_APPS` dan `requirements.txt`, serta menambahkan `corsheaders.middleware.CorsMiddleware` ke `MIDDLEWARE` di `settings.py`
- Menambahkan beberapa konfigurasi berikut ke `settings.py`:
    ```python
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
- Membuat _method view_ untuk login dan logout pada `authentication/views.py` 
    ```python
    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)

    @csrf_exempt
    def logout(request):
        username = request.user.username

        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logout berhasil!"
            }, status=200)
        except:
            return JsonResponse({
            "status": False,
            "message": "Logout gagal."
            }, status=401)
    ```
- Membuat berkas `urls.py` pada direktori `authentication` dan menambahkan URL _routing_ terhadap _method view_ yang sudah dibuat.
    ```python
    from django.urls import path
    from authentication.views import login, logout

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
        path('logout/', logout, name='logout'),
    ]
    ```
- Menambahkan `path('auth/', include('authentication.urls')),` pada berkas `inventory_app/urls.py`

### 3. Membuat halaman login pada proyek tugas Flutter.
- Meng-_install_ _package_ Flutter untuk melakukan kontak dengan _web service Django_ dengan menjalankan perintah `flutter pub add provider` dan `flutter pub add pbp_django_auth`
- Memodifikasi _root widget_ untuk menyediakan `CookieRequest` _library_ ke semua _child widgets_ dengan menggunakan `Provider`.

    Hasil modifikasi:
    ```dart
    class MyApp extends StatelessWidget {
        const MyApp({super.key});

        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
            return Provider(
                create: (_) {
                    CookieRequest request = CookieRequest();
                    return request;
                },
                child: MaterialApp(
                    title: 'Crimson Chest App',
                    theme: ThemeData(
                        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                        useMaterial3: true,
                ),
                home: LoginPage(),
            ));
        }
    }

    ```
- Membuat berkas `login.dart` pada folder `screens` dan mengisinya dengan kode berikut:
    ```dart
    import 'package:inventory_app_mobile/screens/menu.dart';
    import 'package:inventory_app_mobile/screens/register.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
        runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
        const LoginApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
                title: 'Login',
                theme: ThemeData(
                    primarySwatch: Colors.indigo,
                ),
                home: const LoginPage(),
            );
        }
    }

    class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        _LoginPageState createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            appBar: AppBar(
                title: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.indigo[900],
                foregroundColor: Colors.white,
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.indigo),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        ),
                    ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.indigo),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        ),
                    ),
                    obscureText: true,
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                    onPressed: () async {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        final response = await request.login(
                            "http://127.0.0.1:8000/auth/login/",
                            {
                            'username': username,
                            'password': password,
                            });

                        if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];

                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text("$message Welcome, $uname.")));
                        } else {
                        // ignore: use_build_context_synchronously
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                            title: const Text('Login failed'),
                            content: Text(response['message']),
                            actions: [
                                TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                    Navigator.pop(context);
                                },
                                ),
                            ],
                            ),
                        );
                        }
                    },
                    child: const Text('Login'),
                    ),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                    onPressed: () {
                        // Navigate to Register Page
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                    },
                    child: const Text('Register'),
                    )
                ],
                ),
            ),
            );
        }
    }
    ``` 

- Mengubah konfigurasi `home` pada _Widget_ `MaterialApp` di berkas `main.dart` dari `home: MyHomePage()` menjadi `home: LoginPage()`.
- Mengimplementasikan fitur _logout_ dengan menambahkan kode berikut pada `menu_card.dart`
    ```dart
    class MenuCard extends StatelessWidget {
    ...
        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            ...
                // Area responsive terhadap sentuhan
                onTap: () async {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));

                if (item.name == "Show Items") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const ItemsPage(),
                        ));
                }
                // Navigate ke route yang sesuai (tergantung jenis tombol)
                else if (item.name == "Add Items") {
                    // Melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ItemFormPage(),
                    ),
                    );
                } else if (item.name == "Logout") {
                    final response = await request.logout(
                        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                        "http://127.0.0.1:8000/auth/logout/");
                    String message = response["message"];
                    if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                    } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$message"),
                    ));
                    }
                }
                },
            ...
        }
    }
    ```

### 4. Membuat model kustom sesuai dengan proyek aplikasi Django.
- Memanfaatkan [Quicktype](https://app.quicktype.io/) untuk membuat model dengan data JSON dari `http://127.0.0.1:8000/json/` direktori `lib/models` dan mengisinya dengan kode model dari [Quicktype](https://app.quicktype.io/) tadi.

### 5. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
- Menambahkan _package_ [`http`](https://pub.dev/packages/http) dengan menjalankan perintah `flutter pub add http`.
- Menambahkan kode `<uses-permission android:name="android.permission.INTERNET" />` pada berkas `android/app/src/main/AndroidManifest.xml` untuk memperbolehkan akses internet pada aplikasi Flutter.
- Membuat berkas baru bernama `item_list.dart` pada direktori `lib/screens` dan mengisinya dengan kode berikut:
    ```dart
  import 'dart:convert';
  import 'package:crimson_chest_mobile/screens/ItemDetailPage.dart';
  import 'package:http/http.dart' as http;
  import 'package:crimson_chest_mobile/models/product.dart';
  import 'package:crimson_chest_mobile/widgets/left_drawer.dart';
  import 'package:flutter/material.dart';

  class ItemsPage extends StatefulWidget {
    const ItemsPage({Key? key}) : super(key: key);

    @override
    _ItemsPageState createState() => _ItemsPageState();
  }

  class _ItemsPageState extends State<ItemsPage> {
    Future<List<Product>> fetchProduct() async {
      // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
      var url = Uri.parse('http://localhost:8000/json/');
      var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      // melakukan decode response menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // melakukan konversi data json menjadi object Product
      List<Product> listProduct = [];
      for (var d in data) {
        if (d != null) {
          listProduct.add(Product.fromJson(d));
        }
      }
      return listProduct;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
          future: fetchProduct(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching products'));
            } else if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailPage(item: product),
                        ),
                      );
                    },
                    child: Card(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.fields.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 8),
                            Text("Price: \$${product.fields.price}"),
                            const SizedBox(height: 8),
                            Text("Description: ${product.fields.description}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No products found'));
            }
          },
        ),
      );
    }
  }
    ```
- Menambahkan halaman `item_list.dart` ke `widgets/left_drawer.dart` dengan menambahkan kode berikut:
    ```dart
    ...
    ListTile(
        leading: const Icon(Icons.shopping_basket),
        title: const Text('Show Items'),
        onTap: () {
            // Route menu ke halaman produk
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ItemsPage()),
            );
        },
    ),
    ...
    ```

- Mengubah fungsi tombol `Lihat Item` pada halaman utama agar mengarahkan ke halaman `ItemsPage` dengan menambahkan kode berikut pada `widgets/menu_card.dart`: 
    ```dart
    ...
    else (item.name == "Show Items") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ItemsPage(),
        ));
    }
    ...
    ```

#### Melakukan integrasi _form_ Flutter dengan Layanan Django
- Membuat fungsi _view_ baru pada `main/views.py` aplikasi Django dan menambahkan _path_-nya pada `main/urls.py`: `path('create-flutter/', create_product_flutter, name='create_product_flutter'),`
    ```python
    @csrf_exempt
    def create_product_flutter(request):
      if request.method == 'POST':
          
          data = json.loads(request.body)

          new_product = Item.objects.create(
              user = request.user,
              name = data["name"],
              price = int(data["price"]),
              amount = int(data["amount"]),
              description = data["description"],
              modifiers = data["modifiers"],
          )

          new_product.save()

          return JsonResponse({"status": "success"}, status=200)
      else:
          return JsonResponse({"status": "error"}, status=401)
    ```

- Menghubungkan halaman `item_form.dart` dengan `CookieRequest` dengan menambahkan `final request = context.watch<CookieRequest>();` pada `_ItemFormPageState` kemudian memodifikasi perintah `onPressed: ()` menjadi seperti berikut:
    ```dart
    ...
    onPressed: () async {
      if (_formKey.currentState!.validate()) {
        // Kirim ke Django dan tunggu respons
        // DONE: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        final response = await request.postJson(
            "http://localhost:8000/create-flutter/",
            jsonEncode(<String, String>{
              'name': _name,
              'modifiers': _modifiers,
              'amount': _amount.toString(),
              'price': _price.toString(),
              'description': _description,
            }));
        if (response['status'] == 'success') {
          print(response['status']);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content: Text("New item has been saved!"),
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content: Text("ERROR, please try again!"),
          ));
        }
      }
    },
    ...
    ```
### 6. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
- Membuat berkas baru bernama `ItemDetailPage.dart` pada direktori `lib/screens` dan mengisinya dengan kode berikut:
    ```dart
    import 'package:crimson_chest_mobile/models/product.dart';
    import 'package:flutter/material.dart';

    class ItemDetailPage extends StatelessWidget {
      final Product item;

      const ItemDetailPage({Key? key, required this.item}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(item.fields.name),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("name: ${item.fields.name}", style: Theme.of(context).textTheme.headline6),
                        const SizedBox(height: 8),
                        Text("Amount: ${item.fields.amount}"),
                        const SizedBox(height: 8),
                        Text("Price: ${item.fields.price} Gold"),
                        const SizedBox(height: 8),
                        Text("Modifiers: ${item.fields.modifiers}"),
                        const SizedBox(height: 8),
                        Text("Description: ${item.fields.description}"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
    ```

- Mengimport halaman `DetailItemPage` ke `item_list.dart` dan melakukan modifikasi pada berkas `item_list.dart` dengan menambahkan `onTap` pada setiap _item_ buku.
    ```dart
    ...
    return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (_, index) => InkWell(
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ItemDetailPage(item: snapshot.data![index]),
                ),
                );
            },
            child: Card(
            ...
            ),
        ),
    );
    ...
    ```
