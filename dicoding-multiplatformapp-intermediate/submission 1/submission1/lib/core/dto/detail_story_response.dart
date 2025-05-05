import 'package:submission1/core/model/stories.dart';

class DetailStoryResponse {
  bool error;
  String message;
  Stories story;
  DetailStoryResponse({
    required this.error,
    required this.message,
    required this.story,
  });

  factory DetailStoryResponse.fromJson(Map<String, dynamic> json) {
    return DetailStoryResponse(
      error: json['error'],
      message: json['message'],
      story: Stories.fromJson(json['story']),
    );
  }
}
