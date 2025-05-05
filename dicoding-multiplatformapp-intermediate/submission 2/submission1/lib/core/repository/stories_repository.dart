import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submission1/core/dto/add_story_response.dart';
import 'package:submission1/core/dto/detail_story_response.dart';
import 'package:submission1/core/dto/stories_list_response.dart';
import 'package:submission1/core/static/static_app.dart';

class StoriesRepository {
  final String baseUrl = StaticApp.baseUrl;

  Future<AddStoryResponse> addStories(
    List<int> bytes,
    String fileName,
    String description,
    double latitude,
    double longitude,
  ) async {
    final token = await getToken();
    final uri = Uri.parse("$baseUrl/stories");

    var request =
        http.MultipartRequest('POST', uri)
          ..headers["Content-type"] = "multipart/form-data"
          ..headers["Authorization"] = "Bearer $token"
          ..fields["description"] = description
          ..fields['lat'] = latitude.toString()
          ..fields['lon'] = longitude.toString()
          ..files.add(
            http.MultipartFile.fromBytes("photo", bytes, filename: fileName),
          );

    final response = await request.send();

    if (response.statusCode == 201) {
      final responseData = await response.stream.bytesToString();
      return AddStoryResponse.fromJson(jsonDecode(responseData));
    } else {
      throw Exception("Upload file error");
    }
  }

  Future<DetailStoryResponse> getDetailStories(String storyId) async {
    final token = await getToken();
    Map<String, String> header = {"Authorization": "Bearer $token"};
    final response = await get(
      Uri.parse("$baseUrl/stories/$storyId"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return DetailStoryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load stories detail');
    }
  }

  Future<StoriesListResponse> getListStories([
    int page = 1,
    int size = 3,
  ]) async {
    final token = await getToken();
    Map<String, String> header = {"Authorization": "Bearer $token"};
    final response = await get(
      Uri.parse("$baseUrl/stories?page=$page&size=$size"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return StoriesListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load stories list');
    }
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(StaticApp.tokenKey);
  }
}
