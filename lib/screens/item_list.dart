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
