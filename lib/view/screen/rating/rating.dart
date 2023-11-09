import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/rated_provider/rated_provider.dart';
import '../../widget/shred_component/listview_tab.dart';
import '../../widget/shred_component/tabbar_tab.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  void initState() {
    super.initState();
    final ratedProvider = Provider.of<RatedProvider>(context, listen: false);
    ratedProvider.initData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("changed");
  }

  @override
  void didUpdateWidget(covariant Rating oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("updated");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RatedProvider>(
      builder: (context, controller, _) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Rated Media"),
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
              ListViewTab(movieModel: controller.ratedTv, viewType: false),
              ListViewTab(movieModel: controller.ratedMovie, viewType: false),
            ],
          ),
        ),
      ),
    );
  }
}
