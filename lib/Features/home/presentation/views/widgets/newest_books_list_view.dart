import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_book_view_item.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView(
      {super.key, required this.books, required this.scrollController});

  final List<BookEntity> books;
  final ScrollController scrollController;

  @override
  State<NewestBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<NewestBooksListView> {
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    // widget.scrollController = ScrollController();
    widget.scrollController.addListener(_scrollListen);
  }

  void _scrollListen() async {
    var currentPositions = widget.scrollController.position.pixels;
    var maxScrollLength = widget.scrollController.position.maxScrollExtent;

    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        widget.books.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kBookDetailsView,
                extra: widget.books[index],
              );
            },
            child: NewestBookViewItem(
              bookEntity: widget.books[index],
            ),
          ),
        ),
      ),
    );
  }
}
