import 'package:flutter/material.dart';

// 1. Import the barrel files, component.dart and models.dart,
// so you can use data models and UI components.
import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  // 2. TodayRecipeListView needs a list of recipes to display.
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3. Within build(), start by applying some padding.
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      // 4. Add a Column to place widgets in a vertical layout.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 5. In the column, add a Text.
          // This is the header for the Recipes of the Day.
          Text('Recipes of the Day 🍳',
              style: Theme.of(context).textTheme.headline1),
          // 6. Add a 16-point-tall SizedBox, to supply some padding.
          const SizedBox(height: 16),
          // 7. Add a Container, 400 points tall, and set the background color
          // to grey. This container will hold your horizontal list view.
          Container(
            height: 400,
            // TODO: Add ListView Here
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

// TODO: Add buildCard() widget here

}
