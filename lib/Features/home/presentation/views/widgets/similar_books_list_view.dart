import 'package:bookly/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5ZJVlov_JoiTi4y4Z5WgAdKlgZu1tNRQ9Iw&s',
            ),
          );
        },
      ),
    );
  }
}
