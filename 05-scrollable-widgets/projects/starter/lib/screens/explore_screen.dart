import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/explore_data.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late ScrollController _scrollController;

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print('I am at the bottom!');
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      print('I am at the top!');
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

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
          final friendPosts = snapshot.data?.friendPosts ?? [];
          // 5. When the future is complete, return the primary ListView.
          // This holds an explicit list of children. In this scenario,
          // the primary ListView will hold the other two ListViews as children.
          return ListView(
            controller: _scrollController,
            children: [
              TodayRecipeListView(recipes: recipes),
              const SizedBox(height: 16),
              FriendPostListView(friendPosts: friendPosts),
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
