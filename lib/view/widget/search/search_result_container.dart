import 'package:flutter/material.dart';

import '../../../core/extension/string_extension.dart';
import '../../../data/model/movie_model/movie_model.dart';
import '../../screen/details/details_screen.dart';
import '../shred_component/cached_network.dart';

class SearchResultContainer extends StatelessWidget {
  final MovieModel movieModel;
  final bool? viewType;

  const SearchResultContainer(
      {super.key, required this.movieModel, this.viewType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(movieModel: movieModel)));
      },
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomCachedNetwork(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  imageUrl:
                      "${movieModel.posterPath ?? movieModel.backdropPath}"),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieModel.name ?? movieModel.title ?? "name",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    if (viewType == null || viewType == true)
                      Text(movieModel.mediaType!.capitalizeFirst())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
