import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';

import '../models/explore_data.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1. Within the widget’s build(), you create a FutureBuilder
    return FutureBuilder(
      // 2. The FutureBuilder takes in a Future as a parameter. getExploreData()
      // creates a future that will, in turn, return an ExploreData instance.
      // That instance will contain two lists, todayRecipes and friendPosts.
      future: mockService.getExploreData(),
      // 3. Within builder, you use snapshot to check the current state of
      // the Future.
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // TODO: Add Nested List Views
        // 4. Now, the Future is complete and you can extract the data to pass
        // to your widget.
        if (snapshot.connectionState == ConnectionState.done) {
          // 5. snapshot.data returns ExploreData, from which you extract
          // todayRecipes to pass to the list view. Right now,
          // you show a simple text as a placeholder.
          // You’ll build a TodayRecipeListView soon.
          final recipes = snapshot.data?.todayRecipes ?? [];
          return TodayRecipeListView(recipes: recipes);
        } else {
          // 6. The future is still loading, so you show a spinner
          // to let the user know something is happening.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
