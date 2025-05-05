import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1/common/flavor_config.dart';
import 'package:submission1/provider/stories_provider.dart';
import 'package:submission1/screen/story/components/skeleton_stories_list_widget.dart';
import 'package:submission1/screen/story/components/stories_card_widget.dart';

class StoryList extends StatefulWidget {
  final Function(String) onTapped;
  final Function() onLogout;
  final Function() onAddStory;

  const StoryList({
    super.key,
    required this.onTapped,
    required this.onLogout,
    required this.onAddStory,
  });

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          FlavorConfig.instance.values.titleApp,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              AppSettings.openAppSettings();
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: widget.onLogout,
          ),
        ],
      ),
      body: Consumer<StoriesProvider>(
        builder: (context, provider, child) {
          final state = provider.resultState;
          return state.map(
            error: (value) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    value.error,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              );
            },
            loaded: (stories) {
              final storiesList = stories.data;
              if (storiesList.isEmpty) {
                return const Center(child: Text('No stories available'));
              }

              return RefreshIndicator(
                onRefresh: _fetchData,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount:
                      storiesList.length + (provider.hasMoreData ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == storiesList.length && provider.hasMoreData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final story = storiesList[index];
                    return StoriesCardWidget(
                      stories: story,
                      onTapped: widget.onTapped,
                    );
                  },
                ),
              );
            },
            loading: (value) => SkeletonStoryListWidget(),
            none: (value) => const SizedBox(),
          );
        },
      ),
      floatingActionButton:
          FlavorConfig.instance.flavor == FlavorType.paid
              ? FloatingActionButton(
                onPressed: widget.onAddStory,
                child: const Icon(Icons.add),
              )
              : null,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _fetchData());
    _scrollController.addListener(_scrollListener);
  }

  Future<void> _fetchData() async {
    final provider = context.read<StoriesProvider>();
    await provider.fetchStories();
  }

  void _scrollListener() {
    if (_isLoadingMore) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      setState(() {
        _isLoadingMore = true;
      });

      Provider.of<StoriesProvider>(
        context,
        listen: false,
      ).fetchMoreStories().then((_) {
        setState(() {
          _isLoadingMore = false;
        });
      });
    }
  }
}
