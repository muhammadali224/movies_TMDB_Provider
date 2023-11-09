import 'package:flutter/material.dart';

import '../../core/services/api_services.dart';
import '../../data/model/movie_model/movie_model.dart';
import '../../data/source/remote/movies_data/movies_data.dart';

class HomeProvider extends ChangeNotifier {
  Future<List<MovieModel>> getTrending() async {
    var response = await MoviesData(ApiServices()).getTrending();
    List responseList = response["results"];
    List<MovieModel> trendingMovies = [];
    trendingMovies.addAll(responseList.map((e) => MovieModel.fromJson(e)));
    return trendingMovies;
  }

  Future<List<MovieModel>> getTopRated(bool isTv) async {
    var response = await MoviesData(ApiServices()).getTopRated(isTv);
    List responseList = response["results"];
    List<MovieModel> topRated = [];
    topRated.addAll(responseList.map((e) => MovieModel.fromJson(e)));
    return topRated;
  }

  Future<List<MovieModel>> getDiscover(bool isTv) async {
    var response = await MoviesData(ApiServices()).getDiscover(isTv);
    List responseList = response["results"];
    List<MovieModel> discover = [];
    discover.addAll(responseList.map((e) => MovieModel.fromJson(e)));
    return discover;
  }
}
