// Decorator

import '../factory/store_factory.dart';

abstract class BookDecorator {
  int calculatePrice();
}

class CalculateDecorator extends BookDecorator {
  final Book book;

  CalculateDecorator(this.book);

  @override
  int calculatePrice() {
    int total = 2000;

    if (book.type == BookType.fairyTail) total += 500;
    if (book.pages > 1000) total += 1000;
    if (book.author == 'Stephen King') total += 3000;
    if (book.exclusive) total += 5000;

    return total;
  }
}