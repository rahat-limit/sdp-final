enum BookType { fairyTail, mystery, biography, fiction }

// Factory
abstract class Book {
  final String id;
  final String title;
  final String author;
  final BookType type;
  final int pages;
  final bool exclusive;

  Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.type,
      required this.pages,
      required this.exclusive});
}

class FictionBook implements Book {
  final String id;
  final String bookTitle;
  final String bookAuthor;
  final int bookPages;
  final bool isExclusive;

  FictionBook(
      {required this.id,
      required this.bookTitle,
      required this.bookAuthor,
      required this.bookPages,
      required this.isExclusive});
  @override
  String get author => this.bookAuthor;

  @override
  bool get exclusive => this.isExclusive;

  @override
  int get pages => this.bookPages;

  @override
  String get title => this.bookTitle;

  @override
  BookType get type => BookType.fiction;
}

class FairyTailBook implements Book {
  final String id;
  final String bookTitle;
  final String bookAuthor;
  final int bookPages;
  final bool isExclusive;

  FairyTailBook(
      {required this.id,
      required this.bookTitle,
      required this.bookAuthor,
      required this.bookPages,
      required this.isExclusive});

  @override
  String get author => this.bookAuthor;

  @override
  bool get exclusive => this.isExclusive;

  @override
  int get pages => this.bookPages;

  @override
  String get title => this.bookTitle;

  @override
  BookType get type => BookType.fairyTail;
}

abstract class BookStore {
  Book createBook();
}

class FictionBookStore extends BookStore {
  final String bookTitle;
  final String bookAuthor;
  final int bookPages;
  final bool isExclusive;

  FictionBookStore(
      {required this.bookTitle,
      required this.bookAuthor,
      required this.bookPages,
      required this.isExclusive});

  @override
  FictionBook createBook() => FictionBook(
      id: bookTitle,
      bookTitle: bookTitle,
      bookAuthor: bookAuthor,
      bookPages: bookPages,
      isExclusive: isExclusive);
}

class FairyTailBookStore extends BookStore {
  final String bookTitle;
  final String bookAuthor;
  final int bookPages;
  final bool isExclusive;

  FairyTailBookStore(
      {required this.bookTitle,
      required this.bookAuthor,
      required this.bookPages,
      this.isExclusive = false});

  @override
  FairyTailBook createBook() => FairyTailBook(
      id: bookTitle,
      bookTitle: bookTitle,
      bookAuthor: bookAuthor,
      bookPages: bookPages,
      isExclusive: isExclusive);
}
