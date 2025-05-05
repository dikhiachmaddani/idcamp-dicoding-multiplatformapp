import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:submission1/core/model/stories.dart';

part 'stories_list_response.freezed.dart';
part 'stories_list_response.g.dart';

@freezed
class StoriesListResponse with _$StoriesListResponse {
  const factory StoriesListResponse({
    required bool error,
    required String message,
    required List<Stories> listStory,
  }) = _StoriesListResponse;

  factory StoriesListResponse.fromJson(json) =>
      _$StoriesListResponseFromJson(json);
}
