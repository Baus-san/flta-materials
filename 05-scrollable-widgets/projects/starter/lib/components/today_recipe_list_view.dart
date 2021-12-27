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
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 16);
              },
            ),
          ),
        ],
      ),
    );
  }

  /**
   * This function builds the card for each item. Every ExploreRecipe has a
   * cardType. This helps you determine which Card to create for that recipe.
   */
  Widget buildCard(ExploreRecipe recipe) {
    switch (recipe.cardType) {
      case RecipeCardType.card1:
        return Card1(recipe: recipe);
      case RecipeCardType.card2:
        return Card2(recipe: recipe);
      case RecipeCardType.card3:
        return Card3(recipe: recipe);
      default:
        throw Exception('This card doesn\'t exist yet');
    }
  }
}
