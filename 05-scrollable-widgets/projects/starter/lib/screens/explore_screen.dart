import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/explore_data.dart';

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
      // 3. Check the state of the future within the builder callback.
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // 4. Check the state of the future within the builder callback.
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          // 5. When the future is complete, return the primary ListView.
          // This holds an explicit list of children. In this scenario,
          // the primary ListView will hold the other two ListViews as children.
          return ListView(
            children: [
              TodayRecipeListView(recipes: recipes),
              const SizedBox(height: 16),
              // 9 Add a green placeholder container.
              // You’ll create and add the FriendPostListView later.
              // TODO: Replace this with FriendPostListView
              Container(
                height: 400,
                color: Colors.green,
              ),
            ],
          );
        } else {
          // 6. If the future hasn’t finished loading yet,
          // show a circular progress indicator.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
