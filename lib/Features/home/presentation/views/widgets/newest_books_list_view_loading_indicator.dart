import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:bookly/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class NewestBooksListViewLoadingIndicator extends StatelessWidget {
  const NewestBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CustomBookImageLoadingIndicator()
            );
          },
        ),
      ),
    );
  }
}
