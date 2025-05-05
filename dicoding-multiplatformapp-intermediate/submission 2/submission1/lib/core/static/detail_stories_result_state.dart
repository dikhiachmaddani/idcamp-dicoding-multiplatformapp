import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:submission1/core/model/stories.dart';

part 'detail_stories_result_state.freezed.dart';

@freezed
sealed class DetailStoriesResultState with _$DetailStoriesResultState {
  const factory DetailStoriesResultState.error(String error) =
      DetailStoriesErrorState;
  const factory DetailStoriesResultState.loaded(Stories data) =
      DetailStoriesLoadedState;
  const factory DetailStoriesResultState.loading() = DetailStoriesLoadingState;
  const factory DetailStoriesResultState.none() = DetailStoriesNoneState;
}
