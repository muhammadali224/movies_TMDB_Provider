import 'package:flutter/material.dart';

import '../../core/function/show_scaffold_message.dart';
import '../../core/services/api_services.dart';
import '../../data/source/remote/movies_details_data/movies_details_data.dart';

class DetailsProvider extends ChangeNotifier {
  bool isRated = false;
  bool isFavorite = false;
  double rating = 0.0;

  Future<void> getState(int id) async {
    try {
      var response = await MoviesDetailsData(ApiServices()).getAccountState(id);
      isFavorite = response['favorite'];
      if (response["rated"] != false) {
        isRated = true;
        rating = response["rated"]["value"];
      }
    } catch (e) {
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }

  Future<void> addToFavorite(context, int id, String mediaType) async {
    try {
      var response =
          await MoviesDetailsData(ApiServices()).addToFavorite(mediaType, id);
      if (response["success"] == true) {
        isFavorite = true;
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

  Future<void> removeFromFavorite(context, int id, String mediaType) async {
    try {
      var response = await MoviesDetailsData(ApiServices())
          .removeFromFavorite(mediaType, id);
      if (response["success"] == true) {
        isFavorite = false;
        showScaffoldMessage(
            context, "Successfully Removed a Movie to Favorite Movies");
      } else {
        showScaffoldMessage(context, "Something was error");
      }
    } catch (e) {
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }
}
