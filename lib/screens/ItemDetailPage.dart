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
                    // Jika ada gambar item, tambahkan di sini
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