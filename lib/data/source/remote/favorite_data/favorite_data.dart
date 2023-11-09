import '../../../../core/constant/api_link.dart';
import '../../../../core/services/api_services.dart';

class FavoriteData {
  ApiServices crud;

  FavoriteData(this.crud);

  getFavorite(String mediaType) async {
    var response = await crud.getData(
        "${AppLink.server}/account/${AppLink.accountId}/favorite/$mediaType?language=en-US&page=1&sort_by=created_at.asc");
    return response;
  }
}
