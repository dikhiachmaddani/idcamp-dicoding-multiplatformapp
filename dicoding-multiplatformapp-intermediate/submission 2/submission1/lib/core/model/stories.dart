import 'package:freezed_annotation/freezed_annotation.dart';

part 'stories.freezed.dart';
part 'stories.g.dart';

@freezed
class Stories with _$Stories {
  const factory Stories({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required String createdAt,
    double? lat,
    double? lon,
  }) = _Stories;

  factory Stories.fromJson(json) => _$StoriesFromJson(json);
}
