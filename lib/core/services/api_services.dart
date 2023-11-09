import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant/api_link.dart';
import '../function/check_internet.dart';

class ApiServices {
  postData(String url, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data, headers: {
          "Authorization": "Bearer ${AppLink.apiAccessToken}",
          "accept": "application/json",
        });
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          print(responseBody);
          return (responseBody);
        } else {
          throw Exception('Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  getData(String url) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(url), headers: {
          "Authorization": "Bearer ${AppLink.apiAccessToken}",
          "accept": "application/json"
        });

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          print(responseBody);
          return (responseBody);
        } else {
          throw Exception('Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  deleteData(String url) async {
    try {
      if (await checkInternet()) {
        var response = await http.delete(Uri.parse(url), headers: {
          "Authorization": "Bearer ${AppLink.apiAccessToken}",
          "accept": "application/json"
        });

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          print(responseBody);
          return (responseBody);
        } else {
          throw Exception('Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      throw Exception("$e");
    }
  }
}
