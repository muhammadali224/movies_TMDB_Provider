import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/bottom_navigation_provider/bottom_navigayion_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BottomNavigationBarProvider>(context);
    return BottomNavigationBar(
      elevation: 10,
      currentIndex: controller.currentIndex,
      type: BottomNavigationBarType.shifting,
      showUnselectedLabels: false,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.blueGrey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      onTap: (index) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        controller.updateIndex(index);
      },
      items: [
        ...List.generate(
          controller.bottomAppbar.length,
          (index) => BottomNavigationBarItem(
            label: controller.bottomAppbar[index].title,
            activeIcon: Icon(controller.bottomAppbar[index].activeIcon),
            icon: Icon(controller.bottomAppbar[index].icon),
          ),
        ),
      ],
    );
  }
}
