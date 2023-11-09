import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../core/services/api_services.dart';
import '../../data/model/movie_model/movie_model.dart';
import '../../data/source/remote/favorite_data/favorite_data.dart';

class FavoriteProvider extends ChangeNotifier {
  List<MovieModel> favoriteMovie = [];
  List<MovieModel> favoriteTv = [];

  Future<void> getFavoriteTv() async {
    try {
      var response = await FavoriteData(ApiServices()).getFavorite("tv");
      List responseList = response["results"];
      favoriteTv.clear();
      favoriteTv.addAll(responseList.map((e) => MovieModel.fromJson(e)));
    } catch (e) {
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }

  Future<void> getFavoriteMovie() async {
    try {
      var response = await FavoriteData(ApiServices()).getFavorite("movies");
      List responseList = response["results"];
      favoriteMovie.clear();
      favoriteMovie.addAll(responseList.map((e) => MovieModel.fromJson(e)));
    } catch (e) {
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }

  initData() async {
    SmartDialog.showLoading();

    await Future.wait([
      getFavoriteTv(),
      getFavoriteMovie(),
    ]);
    SmartDialog.dismiss();
  }
}
