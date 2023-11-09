import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../data/model/movie_model/movie_model.dart';
import '../../../generated/assets.dart';
import '../search/search_result_container.dart';

class ListViewTab extends StatelessWidget {
  final List<MovieModel> movieModel;
  final bool? viewType;

  const ListViewTab({super.key, required this.movieModel, this.viewType});

  @override
  Widget build(BuildContext context) {
    return movieModel.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(Assets.lottieNoData, height: 250, width: 250),
                Text("No Data Available To Display",
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: movieModel.length,
            itemBuilder: (context, index) => SearchResultContainer(
                  movieModel: movieModel[index],
                  viewType: viewType,
                ));
  }
}
