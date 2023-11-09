import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../core/services/api_services.dart';
import '../../data/model/movie_model/movie_model.dart';
import '../../data/source/remote/rating_data/rating_data.dart';

class RatedProvider extends ChangeNotifier {
  List<MovieModel> ratedMovie = [];
  List<MovieModel> ratedTv = [];

  Future<void> getRatedTv() async {
    try {
      var response = await RatingData(ApiServices()).getRated("tv");
      List responseList = response["results"];
      ratedTv.clear();
      ratedTv.addAll(responseList.map((e) => MovieModel.fromJson(e)));
    } catch (e) {
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }

  Future<void> getRatedMovie() async {
    try {
      var response = await RatingData(ApiServices()).getRated("movies");
      List responseList = response["results"];
      ratedMovie.clear();
      ratedMovie.addAll(responseList.map((e) => MovieModel.fromJson(e)));
    } catch (e) {
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }

  initData() async {
    SmartDialog.showLoading();

    await Future.wait([
      getRatedTv(),
      getRatedMovie(),
    ]);
    SmartDialog.dismiss();
  }
}
