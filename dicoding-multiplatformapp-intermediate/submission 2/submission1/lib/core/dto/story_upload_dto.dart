import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_upload_dto.freezed.dart';

@freezed
class StoryUploadDto with _$StoryUploadDto {
  const factory StoryUploadDto({
    required String description,
    required File photo,
  }) = _StoryUploadDto;
}
