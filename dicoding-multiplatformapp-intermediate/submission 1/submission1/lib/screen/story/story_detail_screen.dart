import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:submission1/core/static/detail_stories_state.dart';
import 'package:submission1/provider/stories_provider.dart';
import 'package:submission1/screen/story/components/skeleton_detail_stories_widget.dart';
import 'package:submission1/screen/story/components/stories_detail_widget.dart';

class StoryDetailScreen extends StatefulWidget {
  final String storyId;
  final Function() onLogout;

  const StoryDetailScreen({
    super.key,
    required this.storyId,
    required this.onLogout,
  });

  @override
  State<StoryDetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<StoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => widget.onLogout(),
          ),
        ],
      ),
      body: Consumer<StoriesProvider>(
        builder: (context, value, child) {
          return switch (value.resultDetailState) {
            DetailStoriesLoadingState() => SkeletonDetailStoriesWidget(),
            DetailStoriesLoadedState(data: var stories) =>
              SingleChildScrollView(
                child: StoriesDetailWidget(stories: stories),
              ),
            DetailStoriesErrorState() => Center(
              child: Text(
                AppLocalizations.of(context)!.networkError,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
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
    await provider.fetchDetailStories(widget.storyId);
    if (!mounted) return;
  }
}
