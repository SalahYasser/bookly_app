import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_ues_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUesCase) : super(NewestBooksInitial());

  final FetchNewestBooksUesCase newestBooksUesCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {

    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }

    var result = await newestBooksUesCase.call(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(NewestBooksFailure(failure.errMessage));
        } else {
          emit(NewestBooksPaginationFailure(failure.errMessage));
        }
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
