import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
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
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  bool _isBottomSheetExpanded = false;

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
        builder: (context, provider, child) {
          final state = provider.resultDetailState;

          return state.map(
            error: (value) {
              return Center(
                child: Text(
                  AppLocalizations.of(context)!.networkError,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            },
            loaded: (value) {
              final story = value.data;
              if (story.lat != null && story.lon != null && _markers.isEmpty) {
                getAddressFromCoordinates(story.lat!, story.lon!);
              }
              final hasLocation = story.lat != null && story.lon != null;

              if (!hasLocation) {
                return SingleChildScrollView(
                  child: StoriesDetailWidget(stories: story),
                );
              }

              return Stack(
                children: [
                  Positioned.fill(
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(story.lat!, story.lon!),
                        zoom: 15.0,
                      ),
                      markers: _markers,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                      zoomControlsEnabled: false,
                      zoomGesturesEnabled: true,
                      mapToolbarEnabled: false,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onVerticalDragUpdate: (details) {
                        if (details.primaryDelta! < -10 &&
                            !_isBottomSheetExpanded) {
                          setState(() {
                            _isBottomSheetExpanded = true;
                          });
                        } else if (details.primaryDelta! > 10 &&
                            _isBottomSheetExpanded) {
                          setState(() {
                            _isBottomSheetExpanded = false;
                          });
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        height:
                            _isBottomSheetExpanded
                                ? MediaQuery.of(context).size.height * 0.55
                                : MediaQuery.of(context).size.height * 0.075,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Center(
                                child: Text(
                                  "Detail Stories",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: StoriesDetailWidget(stories: story),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            loading: (value) {
              return const SkeletonDetailStoriesWidget();
            },
            none: (value) {
              return const SizedBox();
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      print('${place.street}, ${place.locality}, ${place.country}');
      _markers.add(
        Marker(
          markerId: const MarkerId('story_location'),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(
            title: "${place.locality}",
            snippet: '${place.street}, ${place.locality}, ${place.country}',
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (!mounted) return;
      await context.read<StoriesProvider>().fetchDetailStories(widget.storyId);
    });
  }
}
