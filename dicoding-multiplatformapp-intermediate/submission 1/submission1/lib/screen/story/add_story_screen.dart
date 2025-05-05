import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
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
  final formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => onGalleryView(),
                child: Container(
                  width: double.maxFinite,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 238, 238, 238),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child:
                      context.watch<FileProvider>().imagePath == null
                          ? Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image_outlined, size: 25),
                                SizedBox(height: 10),
                                Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.titleUploadImage,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall,
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
                maxLines: 5,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintText: "Enter your description here",
                  filled: true,
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  fillColor: Color.fromARGB(255, 238, 238, 238),
                ),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                style: TextStyle(fontSize: 16, color: Colors.black),
                scrollPadding: EdgeInsets.all(10),
              ),

              const SizedBox(height: 8),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton.extended(
            onPressed:
                () =>
                    processAddStory is AddStoriesLoadingState ? {} : addStory(),
            label: Text(
              processAddStory is AddStoriesLoadingState
                  ? "Process Upload.."
                  : AppLocalizations.of(context)!.titleAddStory,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
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
