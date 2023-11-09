import 'package:flutter/material.dart';

import '../../../data/model/movie_model/movie_model.dart';
import '../../screen/details/details_screen.dart';
import '../shred_component/cached_network.dart';
import '../shred_component/rating_row.dart';

class SectionList extends StatelessWidget {
  final List<MovieModel> movieModel;

  const SectionList({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movieModel.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                          movieModel: movieModel[index],
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomCachedNetwork(
                  imageUrl: "${movieModel[index].posterPath}",
                  borderRadius: BorderRadius.circular(15),
                  width: 150,
                  height: 200,
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        )),
                    child: RatingRow(
                      rateNumber:
                          movieModel[index].voteAverage!.toStringAsFixed(1),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
