import 'package:flutter/cupertino.dart';

import '../../core/enum/search_enum.dart';
import '../../core/services/api_services.dart';
import '../../data/model/movie_model/movie_model.dart';
import '../../data/source/remote/movies_data/movies_data.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  SearchState searchState = SearchState.none;
  List<MovieModel> searchResult = [];

  Future<void> getSearch(String query) async {
    searchResult.clear();
    try {
      searchState = SearchState.loading;
      notifyListeners();
      var response = await MoviesData(ApiServices()).getSearch(query);
      List responseList = response["results"];
      searchState = SearchState.loaded;
      notifyListeners();
      searchResult.addAll(responseList.map((e) => MovieModel.fromJson(e)).where(
          (element) =>
              element.mediaType != "person" && element.overview != ""));
      if (searchResult.isEmpty) {
        searchState = SearchState.noResult;
        notifyListeners();
      }
    } catch (e) {
      throw Exception("Failed to get movies $e");
    }
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
