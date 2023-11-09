import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/bottom_navigation_provider/bottom_navigayion_provider.dart';
import '../../widget/home_widget/bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Consumer<BottomNavigationBarProvider>(
        builder: (context, controller, child) => Container(
            child: controller.listTab.elementAt(controller.currentIndex)),
      ),
    );
  }
}
