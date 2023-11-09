import '../../../../core/constant/api_link.dart';
import '../../../../core/services/api_services.dart';

class MoviesDetailsData {
  ApiServices crud;

  MoviesDetailsData(this.crud);

  changeFavorite(String mediaType, int mediaId, String favState) async {
    var response = await crud
        .postData("${AppLink.server}/account/${AppLink.accountId}/favorite", {
      "media_type": mediaType,
      "media_id": mediaId.toString(),
      "favorite": favState,
    });

    return response;
  }

  addRating(double rateVal, int mediaId, String mediaType) async {
    var response = await crud.postData(
        "${AppLink.server}/$mediaType/$mediaId/rating",
        {"value": rateVal.toString()});
    return response;
  }

  deleteRating(int mediaId, String mediaType) async {
    var response =
        await crud.deleteData("${AppLink.server}/$mediaType/$mediaId/rating");
    return response;
  }

  getAccountState(int id, String mediaType) async {
    var response =
        await crud.getData("${AppLink.server}/$mediaType/$id/account_states");
    return response;
  }
}
