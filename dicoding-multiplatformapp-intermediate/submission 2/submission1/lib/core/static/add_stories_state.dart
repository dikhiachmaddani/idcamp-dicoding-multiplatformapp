import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_stories_state.freezed.dart';

@freezed
sealed class AddStoriesState with _$AddStoriesState {
  const factory AddStoriesState.error(String message) = AddStoriesErrorState;
  const factory AddStoriesState.loaded(String message) = AddStoriesLoadedState;
  const factory AddStoriesState.loading() = AddStoriesLoadingState;
  const factory AddStoriesState.none() = AddStoriesNoneState;
}
