import 'package:submission1/core/model/stories.dart';

class DetailStoriesErrorState extends DetailStoriesResultState {
  final String error;

  DetailStoriesErrorState(this.error);
}

class DetailStoriesLoadedState extends DetailStoriesResultState {
  final Stories data;
  DetailStoriesLoadedState(this.data);
}

class DetailStoriesLoadingState extends DetailStoriesResultState {}

class DetailStoriesNoneState extends DetailStoriesResultState {}

sealed class DetailStoriesResultState {}
