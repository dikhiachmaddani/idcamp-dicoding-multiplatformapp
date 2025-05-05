class AddStoriesErrorState extends AddStoriesState {
  final String message;
  AddStoriesErrorState(this.message);
}

class AddStoriesLoadedState extends AddStoriesState {
  final String message;
  AddStoriesLoadedState(this.message);
}

class AddStoriesLoadingState extends AddStoriesState {}

class AddStoriesNoneState extends AddStoriesState {}

abstract class AddStoriesState {}
