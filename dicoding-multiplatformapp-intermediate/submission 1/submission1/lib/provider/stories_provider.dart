import 'package:flutter/material.dart';
import 'package:submission1/core/repository/stories_repository.dart';
import 'package:submission1/core/static/add_stories_state.dart';
import 'package:submission1/core/static/detail_stories_state.dart';
import 'package:submission1/core/static/stories_state.dart';

class StoriesProvider extends ChangeNotifier {
  final StoriesRepository storyRepository;
  StoriesResultState _resultState = StoriesNoneState();
  AddStoriesState _resultAddStoryState = AddStoriesNoneState();
  DetailStoriesResultState _resultDetailState = DetailStoriesNoneState();
  StoriesProvider(this.storyRepository);

  AddStoriesState get resultAddStoryState => _resultAddStoryState;
  DetailStoriesResultState get resultDetailState => _resultDetailState;
  StoriesResultState get resultState => _resultState;

  Future<void> fetchDetailStories(String storyId) async {
    try {
      _resultDetailState = DetailStoriesLoadingState();
      notifyListeners();

      final result = await storyRepository.getDetailStories(storyId);

      if (result.error) {
        _resultDetailState = DetailStoriesErrorState(result.message);
      } else {
        _resultDetailState = DetailStoriesLoadedState(result.story);
      }
    } on Exception catch (e) {
      _resultDetailState = DetailStoriesErrorState(e.toString());
    }
    notifyListeners();
  }

  Future<void> fetchStories() async {
    try {
      _resultState = StoriesLoadingState();
      notifyListeners();
      final result = await storyRepository.getListStories();
      if (result.error) {
        _resultState = StoriesErrorState(result.message);
      } else {
        _resultState = StoriesLoadedState(result.listStory);
      }
    } on Exception catch (e) {
      _resultState = StoriesErrorState(e.toString());
    }
    notifyListeners();
  }

  Future<void> uploadStory(
    List<int> bytes,
    String fileName,
    String description,
  ) async {
    try {
      _resultAddStoryState = AddStoriesLoadingState();
      notifyListeners();
      final result = await storyRepository.addStories(
        bytes,
        fileName,
        description,
      );
      if (result.error) {
        _resultAddStoryState = AddStoriesErrorState(result.message);
      } else {
        _resultAddStoryState = AddStoriesLoadedState(result.message);
      }
    } on Exception catch (e) {
      _resultAddStoryState = AddStoriesErrorState(e.toString());
    }
    notifyListeners();
  }
}
