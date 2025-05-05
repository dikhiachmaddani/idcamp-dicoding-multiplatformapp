import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:submission1/core/model/stories.dart';

part 'detail_story_response.freezed.dart';
part 'detail_story_response.g.dart';

@freezed
class DetailStoryResponse with _$DetailStoryResponse {
  const factory DetailStoryResponse({
    required bool error,
    required String message,
    required Stories story,
  }) = _DetailStoryResponse;

  factory DetailStoryResponse.fromJson(json) =>
      _$DetailStoryResponseFromJson(json);
}
