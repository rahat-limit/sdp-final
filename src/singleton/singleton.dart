// Singleton
import 'dart:math';

import '../factory/store_factory.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  List<Book> booksState = [];

  void addToState(Book book) {
    booksState.add(book);
  }

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
