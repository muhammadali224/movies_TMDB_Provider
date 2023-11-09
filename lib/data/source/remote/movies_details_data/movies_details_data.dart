import '../../../../core/constant/api_link.dart';
import '../../../../core/services/api_services.dart';

class MoviesDetailsData {
  ApiServices crud;

  MoviesDetailsData(this.crud);

  addToFavorite(String mediaType, int mediaId) async {
    var response = await crud.postData(
        "${AppLink.server}/account/${AppLink.accountId}/favorite", {
      "media_type": mediaType,
      "media_id": mediaId.toString(),
      "favorite": "true"
    });
    return response;
  }

  removeFromFavorite(String mediaType, int mediaId) async {
    var response = await crud.postData(
        "${AppLink.server}/account/${AppLink.accountId}/favorite", {
      "media_type": mediaType,
      "media_id": mediaId.toString(),
      "favorite": "false"
    });
    return response;
  }

  addRating(int mediaId) async {
    var response = await crud.postData(AppLink.discoverMovies, {});
    return response;
  }

  getAccountState(int id) async {
    var response =
        await crud.getData("${AppLink.server}/movie/$id/account_states");
    return response;
  }
}
