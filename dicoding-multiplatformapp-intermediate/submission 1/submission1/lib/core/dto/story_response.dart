import 'package:submission1/core/model/stories.dart';

class StoriesListResponse {
  bool error;
  String message;
  List<Stories> listStory;
  StoriesListResponse({
    required this.error,
    required this.message,
    required this.listStory,
  });

  factory StoriesListResponse.fromJson(Map<String, dynamic> json) {
    var list = json['listStory'] as List;
    List<Stories> listStory = list.map((i) => Stories.fromJson(i)).toList();

    return StoriesListResponse(
      error: json['error'],
      message: json['message'],
      listStory: listStory,
    );
  }
}
