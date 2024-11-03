import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_book_view_item.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<NewestBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<NewestBooksListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListen);
  }

  void _scrollListen() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        controller: _scrollController,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.kBookDetailsView,
                  extra: widget.books[index],
                );
              },
              child: NewestBookViewItem(bookEntity: widget.books[index])
            ),
          );
        },
      ),
    );
  }
}
