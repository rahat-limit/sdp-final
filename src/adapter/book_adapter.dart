// Adapter
import '../factory/store_factory.dart';

class FilterSystem {
  final List<Book> booksState;
  // imitation of an isolated class, where access denied.
  List<String> oldBooksTitles = ['The Fault in Our Stars'];

  FilterSystem(this.booksState);
  List<String> getOldBooks() {
    return oldBooksTitles;
  }
}

class BookAdapter {
  final FilterSystem _bookSystem;

  BookAdapter(this._bookSystem);

  List<Book> filteredOldBooks = [];
  List<Book> filteredExlusiveBooks = [];

  List<Book> filterOldBooks() {
    List<String> oldBooks = _bookSystem.getOldBooks();
    List<Book> booksState = _bookSystem.booksState;

    for (int i = 0; i < booksState.length; i++) {
      if (oldBooks.contains(booksState[i].title)) {
        filteredOldBooks.add(booksState[i]);
      }
    }
    return filteredOldBooks;
  }

  List<Book> filterBooksByGenre(BookType type) {
    List<Book> booksState = _bookSystem.booksState;
    return booksState.where((element) => element.type == type).toList();
  }

  List<Book> filterExclusiveBooks() {
    List<Book> booksState = _bookSystem.booksState;
    for (int i = 0; i < booksState.length; i++) {
      if (booksState[i].exclusive) {
        filteredExlusiveBooks.add(booksState[i]);
      }
    }
    return filteredExlusiveBooks;
  }
}
