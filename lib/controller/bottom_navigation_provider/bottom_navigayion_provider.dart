import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../data/model/bottom_nav_model/bottom_nav_model.dart';
import '../../view/screen/home/home.dart';
import '../../view/screen/search/search.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  List<Widget> listTab = [
    const HomePage(),
    const SearchScreen(),
    const Center(child: Text("fav")),
    const Center(child: Text("rate")),
  ];

  List<BottomNavigationModel> bottomAppbar = [
    BottomNavigationModel(
        title: "home", icon: IconBroken.Home, activeIcon: Icons.home),
    BottomNavigationModel(
        title: "search",
        icon: IconBroken.Search,
        activeIcon: Icons.search_sharp),
    BottomNavigationModel(
        title: "favorite", icon: IconBroken.Heart, activeIcon: Icons.favorite),
    BottomNavigationModel(
        title: "rating", icon: IconBroken.Star, activeIcon: Icons.star_rate),
  ];

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
