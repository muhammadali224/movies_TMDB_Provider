import 'package:flutter/material.dart';

class TabBarTab extends StatelessWidget {
  final String title;
  final IconData icon;
  const TabBarTab({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 7),
          Text(title),
        ],
      ),
    );
  }
}
