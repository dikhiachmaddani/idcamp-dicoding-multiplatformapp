import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_response.freezed.dart';
part 'add_story_response.g.dart';

@freezed
class AddStoryResponse with _$AddStoryResponse {
  const factory AddStoryResponse({
    required String message,
    required bool error,
  }) = _AddStoryResponse;
  factory AddStoryResponse.fromJson(json) => _$AddStoryResponseFromJson(json);
}
