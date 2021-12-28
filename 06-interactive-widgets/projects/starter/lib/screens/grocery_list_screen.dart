import 'package:flutter/material.dart';

import '../components/grocery_tile.dart';
import '../models/grocery_manager.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          return Dismissible(
            // The dismissible widget includes a Key.
            // Flutter needs this to find and
            // remove the right element in the tree.
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            onDismissed: (direction) {
              manager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} dismissed')));
            },
            child: InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                // Return onComplete when the user taps the checkbox.
                onComplete: (change) {
                  // Check if there is a change
                  // and update the item’s isComplete status.
                  if (change != null) {
                    manager.completeItem(index, change);
                  }
                },
              ),
              // When the gesture recognizes a tap, it presents
              // GroceryItemScreen, letting the user edit the current item.
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroceryItemScreen(
                      originalItem: item,
                      // GroceryItemScreen calls onUpdate
                      // when the user updates an item.
                      onUpdate: (item) {
                        // GroceryManager updates the item
                        // at the particular index.
                        manager.updateItem(item, index);
                        // Dismisses GroceryItemScreen.
                        Navigator.pop(context);
                      },
                      onCreate: (item) {
                        // onCreate will not be called since you are updating
                        // an existing item.
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
