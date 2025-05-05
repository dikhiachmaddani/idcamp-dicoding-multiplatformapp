import 'package:flutter/material.dart';
import 'package:submission1/core/model/stories.dart';
import 'package:submission1/core/repository/stories_repository.dart';
import 'package:submission1/core/static/add_stories_state.dart';
import 'package:submission1/core/static/detail_stories_result_state.dart';
import 'package:submission1/core/static/stories_result_state.dart';

class StoriesProvider extends ChangeNotifier {
  final StoriesRepository storyRepository;

  StoriesResultState _resultState = const StoriesResultState.none();

  AddStoriesState _resultAddStoryState = AddStoriesState.none();
  DetailStoriesResultState _resultDetailState = DetailStoriesResultState.none();
  int _page = 1;

  bool _hasMoreData = true;
  final List<Stories> _stories = [];
  StoriesProvider(this.storyRepository);
  bool get hasMoreData => _hasMoreData;
  AddStoriesState get resultAddStoryState => _resultAddStoryState;

  DetailStoriesResultState get resultDetailState => _resultDetailState;
  StoriesResultState get resultState => _resultState;
  List<Stories> get stories => List.unmodifiable(_stories);
  Future<void> fetchDetailStories(String storyId) async {
    try {
      _resultDetailState = DetailStoriesResultState.loading();
      notifyListeners();

      final result = await storyRepository.getDetailStories(storyId);

      if (result.error) {
        _resultDetailState = DetailStoriesResultState.error(result.message);
      } else {
        _resultDetailState = DetailStoriesResultState.loaded(result.story);
      }
    } on Exception catch (e) {
      _resultDetailState = DetailStoriesResultState.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> fetchMoreStories() async {
    if (!_hasMoreData || _resultState == const StoriesResultState.loading()) {
      return;
    }

    try {
      _page += 1;

      final result = await storyRepository.getListStories(_page);

      if (result.listStory.isEmpty) {
        _hasMoreData = false;
      } else {
        _stories.addAll(result.listStory);
        _resultState = StoriesResultState.loaded(List.from(_stories));
      }
      notifyListeners();
    } catch (e) {
      _page -= 1;
      _resultState = StoriesResultState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> fetchStories() async {
    try {
      _resultState = const StoriesResultState.loading();
      notifyListeners();

      _page = 1;
      _hasMoreData = true;

      final result = await storyRepository.getListStories(_page);

      if (result.listStory.isEmpty) {
        _hasMoreData = false;
        _resultState = const StoriesResultState.none();
        _stories.clear();
      } else {
        _stories.clear();
        _stories.addAll(result.listStory);
        _resultState = StoriesResultState.loaded(List.from(_stories));
      }

      notifyListeners();
    } catch (e) {
      _resultState = StoriesResultState.error(e.toString());
      notifyListeners();
    }
  }

  void refreshStories() {
    fetchStories();
  }

  Future<void> uploadStory(
    List<int> bytes,
    String fileName,
    String description,
    double latitude,
    double longitude,
  ) async {
    try {
      _resultAddStoryState = AddStoriesState.loading();
      notifyListeners();

      final result = await storyRepository.addStories(
        bytes,
        fileName,
        description,
        latitude,
        longitude,
      );
      if (result.error) {
        _resultAddStoryState = AddStoriesState.error(result.message);
      } else {
        _resultAddStoryState = AddStoriesState.loaded(result.message);
      }
    } on Exception catch (e) {
      _resultAddStoryState = AddStoriesState.error(e.toString());
    }
    notifyListeners();
  }
}
