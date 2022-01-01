import 'dart:async';
import 'package:flutter/material.dart';

class FooderlichTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onBoardingComplete = false;
  int _selectedTab = FooderlichTab.explore;

  bool get IsInitialized => _initialized;

  bool get isLoggedIn => _loggedIn;

  bool get isOnBoardingComplete => _onBoardingComplete;

  int get getSelectedTab => _selectedTab;

  void initializeApp() {
    Timer(
      const Duration(milliseconds: 2000),
      () {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void completeOnboarding() {
    _onBoardingComplete = true;
    notifyListeners();
  }

  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() {
    _selectedTab = FooderlichTab.recipes;
    notifyListeners();
  }

  void logout() {
    _initialized = false;
    _loggedIn = false;
    _onBoardingComplete = false;
    _selectedTab = 0;

    initializeApp();
    notifyListeners();
  }
}
