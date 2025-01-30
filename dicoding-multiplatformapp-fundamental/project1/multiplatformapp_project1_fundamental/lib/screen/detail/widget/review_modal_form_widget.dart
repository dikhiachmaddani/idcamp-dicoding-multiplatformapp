// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/detail/add_review_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/detail/detail_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/static/add_review_state.dart';
import 'package:provider/provider.dart';

class ReviewModalFormWidget extends StatefulWidget {
  final String id;

  const ReviewModalFormWidget({
    super.key,
    required this.id,
  });

  @override
  ReviewModalFormWidgetState createState() => ReviewModalFormWidgetState();
}

class ReviewModalFormWidgetState extends State<ReviewModalFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postReviewProvider = Provider.of<AddReviewProvider>(context);
    final detailRestourantProvider =
        Provider.of<DetailRestaurantProvider>(context);

    return Container(
      height: 320,
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _reviewController,
              decoration: InputDecoration(
                  labelText: 'Review',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  )),
              maxLines: 2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Review tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            _isLoading
                ? const CircularProgressIndicator()
                : Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Batal'),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await postReviewProvider.addReview(
                                widget.id,
                                _nameController.text,
                                _reviewController.text,
                              );
                              _isLoading = true;
                              final state = postReviewProvider.resultState;
                              if (state is AddReviewSuccessState) {
                                _isLoading = false;
                                await detailRestourantProvider
                                    .fetchDetailRestaurant(widget.id);
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                    'Terima Kasih ${state.customerReviews[state.customerReviews.length - 1].name} sudah mereview tempat ini!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  )),
                                );
                              } else if (state is AddReviewErrorState) {
                                _isLoading = false;
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                    'Error: ${state.message}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  )),
                                );
                              }
                            }
                          },
                          child: const Text('Kirim'),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
