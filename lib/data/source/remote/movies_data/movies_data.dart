import '../../../../core/constant/api_link.dart';
import '../../../../core/services/api_services.dart';

class MoviesData {
  ApiServices crud;

  MoviesData(this.crud);

  getTrending() async {
    var response = await crud.getData(AppLink.trending);
    return response;
  }

  getTopRated(bool isTv) async {
    var response =
        await crud.getData(isTv ? AppLink.topRatedTV : AppLink.topRated);
    return response;
  }

  getDiscover(bool isTv) async {
    var response =
        await crud.getData(isTv ? AppLink.discoverTv : AppLink.discoverMovies);
    return response;
  }

  getSearch(String query) async {
    var response = await crud.getData(
        "${AppLink.searchMulti}$query&include_adult=false&language=en-US&page=1");
    print(
        "${AppLink.searchMulti}$query&include_adult=false&language=en-US&page=1");
    return response;
  }
}
