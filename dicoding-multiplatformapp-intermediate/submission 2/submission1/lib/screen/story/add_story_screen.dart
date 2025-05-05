import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:submission1/core/static/add_stories_state.dart';
import 'package:submission1/provider/file_provider.dart';
import 'package:submission1/provider/stories_provider.dart';

class AddStoryScreen extends StatefulWidget {
  final Function() onSuccessUpload;
  const AddStoryScreen({super.key, required this.onSuccessUpload});

  @override
  State<AddStoryScreen> createState() => _StoryListState();
}

class _StoryListState extends State<AddStoryScreen> {
  final descriptionController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  GoogleMapController? mapController;
  bool isBottomSheetExpanded = false;
  final Set<Marker> markers = {};
  geo.Placemark? placemark;

  double latitude = -6.8957473;
  double longitude = 107.6337669;
  final initialPinPoint = const LatLng(-6.8957473, 107.6337669);

  addStory() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final uploadProvider = context.read<StoriesProvider>();
    final fileProvider = context.read<FileProvider>();
    final resultAddStoryState = uploadProvider.resultAddStoryState;
    final imagePath = fileProvider.imagePath;
    final imageFile = fileProvider.imageFile;

    if (imagePath == null || imageFile == null) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.scrim,
          content: Text(
            'Please select an image first.',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      );
      return;
    }

    final fileName = imageFile.name;
    final bytes = await imageFile.readAsBytes();

    try {
      await uploadProvider.uploadStory(
        bytes,
        fileName,
        descriptionController.text,
        latitude,
        longitude,
      );

      if (resultAddStoryState is AddStoriesLoadedState) {
        fileProvider.setImageFile(null);
        fileProvider.setImagePath(null);

        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              'Story uploaded successfully!',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 181, 181, 181),
              ),
            ),
          ),
        );
        await uploadProvider.fetchStories();
        widget.onSuccessUpload();
      } else if (resultAddStoryState is AddStoriesErrorState) {
        final message =
            (uploadProvider.resultAddStoryState as AddStoriesErrorState)
                .message;
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 181, 181, 181),
              ),
            ),
          ),
        );
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            'Error: $e',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 181, 181, 181),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final processAddStory =
        context.watch<StoriesProvider>().resultAddStoryState;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.titleAddStory,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialPinPoint,
                zoom: 14.0,
              ),
              markers: markers,
              onMapCreated: (controller) async {
                final info = await geo.placemarkFromCoordinates(
                  initialPinPoint.latitude,
                  initialPinPoint.longitude,
                );

                final place = info[0];
                final street = place.street!;
                final address =
                    '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
                setState(() {
                  placemark = place;
                });

                defineMarker(initialPinPoint, street, address);

                setState(() {
                  mapController = controller;
                });
              },
              onLongPress: (LatLng latLng) => onLongPressGoogleMap(latLng),
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              mapToolbarEnabled: false,
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: FloatingActionButton(
              child: const Icon(Icons.my_location),
              onPressed: () => onMyLocationButtonPress(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta! < -10 && !isBottomSheetExpanded) {
                  setState(() {
                    isBottomSheetExpanded = true;
                  });
                } else if (details.primaryDelta! > 10 &&
                    isBottomSheetExpanded) {
                  setState(() {
                    isBottomSheetExpanded = false;
                  });
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                height:
                    isBottomSheetExpanded
                        ? MediaQuery.of(context).size.height * 0.6
                        : MediaQuery.of(context).size.height * 0.09,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.titleAddStory,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () => onGalleryView(),
                                child: Container(
                                  width: double.maxFinite,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 238, 238, 238),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child:
                                      context.watch<FileProvider>().imagePath ==
                                              null
                                          ? Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.image_outlined,
                                                  size: 25,
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  AppLocalizations.of(
                                                    context,
                                                  )!.titleUploadImage,
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      Theme.of(
                                                        context,
                                                      ).textTheme.bodySmall,
                                                ),
                                              ],
                                            ),
                                          )
                                          : showImage(),
                                ),
                              ),
                              const SizedBox(height: 25),
                              TextFormField(
                                controller: descriptionController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your description.';
                                  }
                                  return null;
                                },
                                minLines: null,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  hintText: "Enter your description here",
                                  filled: true,
                                  hintStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  fillColor: Color.fromARGB(255, 238, 238, 238),
                                ),
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                scrollPadding: EdgeInsets.all(10),
                              ),
                              const SizedBox(height: 25),
                              TextFormField(
                                controller: addressController,
                                enabled: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your address.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  fillColor: Colors.grey[200],
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  hintText: "Enter your address here",
                                  filled: true,
                                  hintStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                ),
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                scrollPadding: EdgeInsets.all(10),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  onPressed:
                                      processAddStory is AddStoriesLoadingState
                                          ? null
                                          : addStory,
                                  child: Text(
                                    style: TextStyle(color: Colors.white),
                                    processAddStory is AddStoriesLoadingState
                                        ? "Processing Upload.."
                                        : AppLocalizations.of(
                                          context,
                                        )!.titleAddStory,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(title: street, snippet: address),
    );
    setState(() {
      addressController.text =
          "${placemark!.subLocality}, ${placemark!.locality}, ${placemark!.postalCode}, ${placemark!.country}";
      latitude = latLng.latitude;
      longitude = latLng.longitude;
      markers.clear();
      markers.add(marker);
    });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    addressController.dispose();
    mapController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  onGalleryView() async {
    final provider = context.read<FileProvider>();

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  void onLongPressGoogleMap(LatLng latLng) async {
    final info = await geo.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
    });
    defineMarker(latLng, street, address);
    mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void onMyLocationButtonPress() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }
    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);
    final info = await geo.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
    });

    defineMarker(latLng, street, address);
    mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  Widget showImage() {
    final provider = context.read<FileProvider>();
    File path = File(provider.imagePath ?? "");
    return FittedBox(
      clipBehavior: Clip.hardEdge,
      fit: BoxFit.cover,
      child: Image.file(path),
    );
  }
}
