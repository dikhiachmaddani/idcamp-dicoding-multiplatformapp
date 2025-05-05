// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoriesListResponseImpl _$$StoriesListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$StoriesListResponseImpl(
  error: json['error'] as bool,
  message: json['message'] as String,
  listStory:
      (json['listStory'] as List<dynamic>).map(Stories.fromJson).toList(),
);

Map<String, dynamic> _$$StoriesListResponseImplToJson(
  _$StoriesListResponseImpl instance,
) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
  'listStory': instance.listStory,
};
