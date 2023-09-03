

import 'package:bloc/bloc.dart';

import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  SearchRepo searchRepo;
  Future<void> searchBooks({required String query}) async {
    emit(SearchLoading());
    var result = await searchRepo.searchBooks(query: query);
    result.fold((failure) {
      emit(
        SearchFailure(eMessage: failure.eMessage),
      );
    }, (books) {
      emit(SearchSuccess(books: books));
    });
  }
}
