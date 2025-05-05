import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:submission1/core/model/stories.dart';

part 'stories_result_state.freezed.dart';

@freezed
sealed class StoriesResultState with _$StoriesResultState {
  const factory StoriesResultState.error(String error) = StoriesErrorState;
  const factory StoriesResultState.loaded(List<Stories> data) =
      StoriesLoadedState;
  const factory StoriesResultState.loading() = StoriesLoadingState;
  const factory StoriesResultState.none() = StoriesNoneState;
}
