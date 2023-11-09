import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/favorite_provider/favorite_provider.dart';
import '../../widget/shred_component/listview_tab.dart';
import '../../widget/shred_component/tabbar_tab.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    super.initState();
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    favoriteProvider.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, controller, _) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Favorite"),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                TabBarTab(title: 'TV Show', icon: Icons.tv),
                TabBarTab(title: 'Movie', icon: Icons.movie),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListViewTab(movieModel: controller.favoriteTv, viewType: false),
              ListViewTab(
                  movieModel: controller.favoriteMovie, viewType: false),
            ],
          ),
        ),
      ),
    );
  }
}
