import '../../../core/services/api_services.dart';

class TestData {
  ApiServices crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData("AppLink", {});
    return response.fold((l) => l, (r) => r);
  }
}
