import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_ues_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUesCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUesCase featuredBooksUesCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {

    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }

    var result = await featuredBooksUesCase.call(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(failure.errMessage));
        } else {
          emit(FeaturedBooksPaginationFailure(failure.errMessage));
        }
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
