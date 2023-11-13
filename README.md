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