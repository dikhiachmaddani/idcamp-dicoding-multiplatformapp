import 'package:submission1/core/model/stories.dart';

class StoriesErrorState extends StoriesResultState {
  final String error;

  StoriesErrorState(this.error);
}

class StoriesLoadedState extends StoriesResultState {
  final List<Stories> data;
  StoriesLoadedState(this.data);
}

class StoriesLoadingState extends StoriesResultState {}

class StoriesNoneState extends StoriesResultState {}

sealed class StoriesResultState {}
