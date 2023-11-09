import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/string_extension.dart';
import '../../../data/model/movie_model/movie_model.dart';
import '../../screen/details/details_screen.dart';
import '../shred_component/cached_network.dart';
import '../shred_component/rating_row.dart';

class ScrollSlider extends StatelessWidget {
  final List<MovieModel> movieModel;

  const ScrollSlider({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: movieModel.length,
        itemBuilder: (BuildContext context, int index, int realIndex) =>
            GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                          movieModel: movieModel[index],
                        )));
          },
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CustomCachedNetwork(
                imageUrl: "${movieModel[index].posterPath}",
                borderRadius: BorderRadius.circular(15),
                width: 200,
                height: 300,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                      child:
                          Text(movieModel[index].mediaType!.capitalizeFirst())),
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
                      )),
                ],
              )
            ],
          ),
        ),
        options: CarouselOptions(
            height: 300,
            enlargeCenterPage: true,
            autoPlay: true,
            pageSnapping: true,
            viewportFraction: 0.55,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1)),
      ),
    );
  }
}
