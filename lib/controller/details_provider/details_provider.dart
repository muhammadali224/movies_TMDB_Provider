import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../core/function/show_scaffold_message.dart';
import '../../core/services/api_services.dart';
import '../../data/model/movie_model/movie_model.dart';
import '../../data/source/remote/movies_details_data/movies_details_data.dart';

class DetailsProvider extends ChangeNotifier {
  bool isFavorite = false;
  double rating = 0.0;
  double rateValue = 0.0;

  Future<void> getState(int id, String mediaType) async {
    try {
      SmartDialog.showLoading();
      var response =
          await MoviesDetailsData(ApiServices()).getAccountState(id, mediaType);
      SmartDialog.dismiss();
      isFavorite = response['favorite'];
      if (response["rated"] != false) {
        rating = response["rated"]["value"];
        notifyListeners();
      } else {
        rating = 0.0;
      }
    } catch (e) {
      SmartDialog.dismiss();
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }

  Future<void> changeFavorite(context, int id, String mediaType) async {
    try {
      var response = await MoviesDetailsData(ApiServices())
          .changeFavorite(mediaType, id, "${!isFavorite}");
      print("${!isFavorite}");
      if (response["success"] == true) {
        isFavorite = !isFavorite;
        showScaffoldMessage(
            context, "Successfully Added a Movie to Favorite Movies");
      } else {
        showScaffoldMessage(context, "Something was error");
      }
    } catch (e) {
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }

  Future<void> addRate(
      context, int id, String mediaType, double rateValue) async {
    try {
      SmartDialog.showLoading();
      var response = await MoviesDetailsData(ApiServices())
          .addRating(rateValue, id, mediaType);
      SmartDialog.dismiss();
      if (response["success"] == true) {
        await getState(id, mediaType);
        rateValue = 0.0;
        notifyListeners();
      } else {
        showScaffoldMessage(context, "Something was error");
      }
    } catch (e) {
      SmartDialog.dismiss();
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }

  Future<void> removeRate(context, int id, String mediaType) async {
    try {
      var response =
          await MoviesDetailsData(ApiServices()).deleteRating(id, mediaType);
      if (response["success"] == true) {
        getState(id, mediaType);
        rateValue = 0.0;
        showScaffoldMessage(context, "Successfully Remove Rate To Movie");
      } else {
        showScaffoldMessage(context, "Something was error");
      }
    } catch (e) {
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }

  String getMediaType(MovieModel model) {
    if (model.mediaType != null) {
      return model.mediaType!;
    } else {
      if (model.name == null) {
        return "movie";
      } else {
        return "tv";
      }
    }
  }
}
