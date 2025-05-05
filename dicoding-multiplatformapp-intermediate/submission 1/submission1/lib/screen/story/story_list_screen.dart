import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:submission1/core/static/stories_state.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Masto.',
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
        builder: (context, value, child) {
          return switch (value.resultState) {
            StoriesLoadingState() => SkeletonStoryListWidget(),
            StoriesLoadedState(data: var storiesList) => RefreshIndicator(
              onRefresh: () => _fetchData(),
              child: ListView.builder(
                itemCount: storiesList.length,
                itemBuilder: (context, index) {
                  final stories = storiesList[index];
                  return StoriesCardWidget(
                    stories: stories,
                    onTapped: widget.onTapped,
                  );
                },
              ),
            ),
            StoriesErrorState() => Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context)!.networkError,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            _ => const SizedBox(),
          };
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.onAddStory(),
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    if (!mounted) return;
    final provider = context.read<StoriesProvider>();
    await provider.fetchStories();
    if (!mounted) return;
  }
}
