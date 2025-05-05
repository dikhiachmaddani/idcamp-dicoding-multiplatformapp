import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:submission1/core/model/stories.dart';

class StoriesDetailWidget extends StatelessWidget {
  final Stories stories;
  const StoriesDetailWidget({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    DateTime createdAtDate = DateTime.parse(stories.createdAt);
    String formattedDate = DateFormat('dd MMMM yyyy').format(createdAtDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: CachedNetworkImageProvider(
                  stories.photoUrl,
                  cacheManager: CacheManager(
                    Config(stories.id, stalePeriod: const Duration(seconds: 3)),
                  ),
                ),
                backgroundColor: Colors.blueGrey,
              ),
              const SizedBox(width: 10),
              Text(
                stories.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.grey[200],
              ),
              CachedNetworkImage(
                cacheKey: "stories-${stories.id}",
                imageUrl: stories.photoUrl,
                fit: BoxFit.contain,
                progressIndicatorBuilder: (context, url, progress) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.grey[300],
                      height: double.infinity,
                    ),
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
                cacheManager: CacheManager(
                  Config(stories.id, stalePeriod: const Duration(seconds: 3)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stories.description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 5),
              Text(
                AppLocalizations.of(context)!.createdAt(formattedDate),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
