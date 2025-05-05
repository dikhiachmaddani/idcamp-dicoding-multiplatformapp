import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:submission1/core/model/stories.dart';

class StoriesCardWidget extends StatelessWidget {
  final Stories stories;
  final Function(String) onTapped;

  const StoriesCardWidget({
    super.key,
    required this.stories,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    DateTime createdAtDate = DateTime.parse(stories.createdAt);
    String formattedDate = DateFormat('dd MMMM yyyy').format(createdAtDate);

    return GestureDetector(
      onTap: () => onTapped(stories.id),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 15),
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(stories.photoUrl),
                ),
                const SizedBox(width: 10),
                Text(
                  stories.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CachedNetworkImage(
              cacheKey: stories.id,
              imageUrl: stories.photoUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 275,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stories.description,
                    style: Theme.of(context).textTheme.titleSmall,
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
        ),
      ),
    );
  }
}
