part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}
// crate SimilarBooksSuccess state
final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccess({required this.books});

}
// crate SimilarBooksFailure state
final class SimilarBooksFailure extends SimilarBooksState {
  final String eMessage;

  const SimilarBooksFailure({required this.eMessage});

}

// crate SimilarBooksLoading state
final class SimilarBooksLoading extends SimilarBooksState {}
