import '../../../../core/constant/api_link.dart';
import '../../../../core/services/api_services.dart';

class RatingData {
  ApiServices crud;

  RatingData(this.crud);

  getRated(String mediaType) async {
    var response = await crud.getData(
        "${AppLink.server}/account/${AppLink.accountId}/rated/$mediaType?language=en-US&page=1&sort_by=created_at.asc");
    return response;
  }
}
