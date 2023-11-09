import 'package:flutter/material.dart';

class BottomNavigationModel {
  String title;
  IconData activeIcon;
  IconData icon;

  BottomNavigationModel(
      {required this.title, required this.activeIcon, required this.icon});
}
