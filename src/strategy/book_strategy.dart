// Strategy
import '../factory/store_factory.dart';

abstract class SearchStrategy {
  final List<Book> books;

  SearchStrategy(this.books);

  List<Book> search(String text);
}

class SearchByAuthor implements SearchStrategy {
  final List<Book> booksState;

  SearchByAuthor(this.booksState);

  @override
  List<Book> search(String authorText) {
    List<Book> result = booksState
        .where((e) => e.author.toLowerCase().contains(authorText.toLowerCase()))
        .toList();
    return result;
  }

  @override
  List<Book> get books => booksState;
}

class SearchByTitle implements SearchStrategy {
  final List<Book> booksState;

  SearchByTitle(this.booksState);

  @override
  List<Book> search(String bookTitle) {
    List<Book> resultsBook = booksState
        .where((e) => e.title.toLowerCase().contains(bookTitle.toLowerCase()))
        .toList();
    return resultsBook;
  }

  @override
  List<Book> get books => booksState;
}
