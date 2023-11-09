import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_provider/home_provider.dart';
import '../../widget/home_widget/future_top_rated.dart';
import '../../widget/home_widget/header.dart';
import '../../widget/home_widget/scroll_slider.dart';
import '../../widget/shred_component/handling_error.dart';
import '../../widget/shred_component/loadin_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Lumovies",
            style: TextStyle(color: Colors.red, fontSize: 30)),
        centerTitle: true,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, controller, child) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(headerText: 'Trending '),
              FutureBuilder(
                future: controller.getTrending(),
                builder: (context, snapshot) {
                  return snapshot.hasError
                      ? HandlingError(errorMessage: snapshot.error.toString())
                      : snapshot.hasData
                          ? ScrollSlider(movieModel: snapshot.data!)
                          : const LoadingIndicator();
                },
              ),
              const HeaderText(headerText: 'Discover Movies'),
              TopRated(future: controller.getDiscover(false)),

              const HeaderText(headerText: 'Discover Tv'),
              TopRated(future: controller.getDiscover(true)),
              const HeaderText(headerText: 'Top Rated Movies'),
              TopRated(future: controller.getTopRated(false)),

              const HeaderText(headerText: 'Top Rated Tv'),
              TopRated(future: controller.getTopRated(true)),
              // const SectionList(),
            ],
          ),
        ),
      ),
    );
  }
}
