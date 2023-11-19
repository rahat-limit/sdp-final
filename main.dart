import 'dart:math';
import 'dart:io';

import 'src/adapter/book_adapter.dart';
import 'src/decorator/book_decorator.dart';
import 'src/facade/store_facade.dart';
import 'src/factory/store_factory.dart';
import 'src/singleton/singleton.dart';
import 'src/strategy/book_strategy.dart';

void main() {
  // Singleton
  // Role: State Management. Contains All Books.
  var singleton = Singleton();

  // Factory - creates model of object.
  // BookStore fictionBookStore = FictionBookStore(
  //     bookAuthor: 'Stephen King',
  //     bookTitle: 'King of Horror',
  //     bookPages: 1138,
  //     isExclusive: true);
  // Book fictionBook = fictionBookStore.createBook();

  BookStore fairyTailBookStore = FairyTailBookStore(
      bookTitle: 'The Fault in Our Stars',
      bookAuthor: 'John Green',
      bookPages: 313,
      isExclusive: false);
  Book fairyTailBook = fairyTailBookStore.createBook();

  // Add to State
  // singleton.addToState(fictionBook);
  singleton.addToState(fairyTailBook);

  // fictionBook.showType();
  // fairyTailBook.showType();

  // // Strategy
  // SearchStrategy searchByAuthor = SearchByAuthor(singleton.booksState);
  // print(searchByAuthor.search('Stephen King')!.title);

  SearchStrategy searchByTitle = SearchByTitle(singleton.booksState);

  // // Adapter - позволяет объектам с несовместимыми интерфейсами работать вместе.
  var oldSystem = FilterSystem(singleton.booksState);
  var adapter = BookAdapter(oldSystem);

  // adapter.filterExclusiveBooks();
  // adapter.filterOldBooks();
  // print('Length of Old Books: ${adapter.filteredOldBooks.length}');
  // print('Length of Exlusive Books: ${adapter.filteredExlusiveBooks.length}');

  // // Decorator - позволяет динамически добавлять объектам новую функциональность, оборачивая их в полезные «обёртки».
  // var fairyTailPrice = CalculateDecorator(fairyTailBook);
  // var fictionBookPrice = CalculateDecorator(fictionBook);
  // print('Price: ${fairyTailPrice.calculatePrice()}');
  // print('Price: ${fictionBookPrice.calculatePrice()}');

  // UI INTERFACE

  // Functions: getAllBooks, search, add, buy

  print(
      '====================👋👋👋 Welcome to BookStore, dear Customer!====================\n');
  while (true) {
    print('Some actions you are can choose. Enter number to start:');
    print(
        '1) Add New Book to BookStore.\n2) Get Books From BookStore.\n3) Search for specific book.\n4) Buy a Book.');
    // if 2, 3 - list of books with indexes, functions to buy or go back.
    // if 1 - Successfully added.
    String? actionIndex = stdin.readLineSync();
    switch (actionIndex!.trim()) {
      case '1':
        // add book
        print(
            'Choose a genre of a book:\n\n1) Fairy Tail\n2) Fiction\n3) Back');
        while (true) {
          String? genreIndex = stdin.readLineSync();
          switch (genreIndex!.trim()) {
            case '1':
              // Fairy Tail Book
              String bookTitle = '';
              String bookAuthor = '';
              int amountOfPages = 0;

              while (true) {
                print('Title: (For Example: King of Horror)');
                String? title = stdin.readLineSync();
                if (title == null || title.isEmpty) {
                  false;
                } else {
                  bookTitle = title;
                  while (true) {
                    print('Author: (For Example: Stephen King)');
                    String? author = stdin.readLineSync();
                    if (author == null || author.isEmpty) {
                      false;
                    } else {
                      bookAuthor = author;
                      while (true) {
                        print('Amount of Pages: (For Example: 300)');

                        try {
                          String? pages = stdin.readLineSync();

                          if (int.parse(pages!) < 0) {
                            false;
                          } else {
                            amountOfPages = int.parse(pages);
                            while (true) {
                              print(
                                  'Is This Exclusive or Not? Enter Yes or No.');
                              String? exclusive = stdin.readLineSync();
                              if (exclusive == null || exclusive.isEmpty) {
                                false;
                              } else {
                                if (exclusive.toLowerCase().trim() != 'no' &&
                                    exclusive.toLowerCase().trim() != 'yes') {
                                  false;
                                } else {
                                  BookStore fairyTailBookStore =
                                      FairyTailBookStore(
                                          bookTitle: bookTitle,
                                          bookAuthor: bookAuthor,
                                          bookPages: amountOfPages,
                                          isExclusive: exclusive
                                                  .toLowerCase()
                                                  .trim()
                                                  .contains('yes')
                                              ? true
                                              : false);
                                  Book fairyTailBook =
                                      fairyTailBookStore.createBook();
                                  // Added To State
                                  singleton.addToState(fairyTailBook);
                                  print(
                                      '====================🤟🤟 Successfully added to BookStore!!====================\n\n');

                                  break;
                                }
                              }
                            }
                            break;
                          }
                        } on FormatException {
                          false;
                        }
                      }
                      break;
                    }
                  }
                }
                break;
              }
              break;
            case '2':
              // Fiction Book
              String bookTitle = '';
              String bookAuthor = '';
              int amountOfPages = 0;

              while (true) {
                print('Title: (For Example: King of Horror)');
                String? title = stdin.readLineSync();
                if (title == null || title.isEmpty) {
                  false;
                } else {
                  bookTitle = title;
                  while (true) {
                    print('Author: (For Example: Stephen King)');
                    String? author = stdin.readLineSync();
                    if (author == null || author.isEmpty) {
                      false;
                    } else {
                      bookAuthor = author;
                      while (true) {
                        print('Amount of Pages: (For Example: 300)');

                        try {
                          String? pages = stdin.readLineSync();

                          if (int.parse(pages!) < 0) {
                            false;
                          } else {
                            amountOfPages = int.parse(pages);
                            while (true) {
                              print(
                                  'Is This Exclusive or Not? Enter Yes or No.');
                              String? exclusive = stdin.readLineSync();
                              if (exclusive == null || exclusive.isEmpty) {
                                false;
                              } else {
                                if (exclusive.toLowerCase().trim() != 'no' &&
                                    exclusive.toLowerCase().trim() != 'yes') {
                                  false;
                                } else {
                                  BookStore fictionBookStore = FictionBookStore(
                                      bookTitle: bookTitle,
                                      bookAuthor: bookAuthor,
                                      bookPages: amountOfPages,
                                      isExclusive: exclusive
                                              .toLowerCase()
                                              .trim()
                                              .contains('yes')
                                          ? true
                                          : false);
                                  Book fictionBook =
                                      fictionBookStore.createBook();
                                  // Added To State
                                  singleton.addToState(fictionBook);
                                  print(
                                      '====================🤟🤟 Successfully added to BookStore!!====================\n\n');
                                  break;
                                }
                              }
                            }
                            break;
                          }
                        } on FormatException {
                          false;
                        }
                      }
                      break;
                    }
                  }
                }
                break;
              }
              break;
            case '3':
              // Go Back
              break;
            default:
              false;
          }
          break;
        }
      case '2':
        // get books
        print(
            'Do you want get:\n1) ALL BOOKS\n2) BOOKS BY GENRE\n3) Exclusive Books\n4) OutDated/OLD books\n5) LEAVE');
        String? index = stdin.readLineSync();
        switch (index!.trim()) {
          case '1':
            List<Book> books = singleton.booksState;
            if (books.isEmpty) {
              print('🫗🫗No Books left...🫗🫗');
              break;
            }
            for (int i = 0; i < books.length; i++) {
              print(
                  '${i + 1} 📕: Title: ${books[i].title}, Author: ${books[i].author}, Type: ${books[i].type.name}, Amount Of Pages: ${books[i].pages} ${books[i].exclusive ? ', 🌟🌟Exclusive🌟🌟' : ''}');
              if (i + 1 == books.length) print('\n');
            }
            break;
          case '2':
            while (true) {
              print('1) Fiction\n2) Fairy Tail\n3) Leave');
              String? index = stdin.readLineSync();
              switch (index) {
                case '1':
                  List<Book> books =
                      adapter.filterBooksByGenre(BookType.fiction);
                  if (books.isEmpty) {
                    print('🫗🫗No Books left...🫗🫗');
                    break;
                  }
                  for (int i = 0; i < books.length; i++) {
                    print(
                        '${i + 1} 📕: Title: ${books[i].title}, Author: ${books[i].author}, Type: ${books[i].type.name}, Amount Of Pages: ${books[i].pages} ${books[i].exclusive ? ', 🌟🌟Exclusive🌟🌟' : ''}');
                    if (i + 1 == books.length) print('\n');
                  }
                  break;
                case '2':
                  List<Book> books =
                      adapter.filterBooksByGenre(BookType.fairyTail);
                  if (books.isEmpty) {
                    print('🫗🫗No Books left...🫗🫗');
                    break;
                  }
                  for (int i = 0; i < books.length; i++) {
                    print(
                        '${i + 1} 📕: Title: ${books[i].title}, Author: ${books[i].author}, Type: ${books[i].type.name}, Amount Of Pages: ${books[i].pages} ${books[i].exclusive ? ', 🌟🌟Exclusive🌟🌟' : ''}');
                    if (i + 1 == books.length) print('\n');
                  }
                  break;
                case '3':
                  break;
                default:
                  false;
              }
              break;
            }
          case '3':
            List<Book> books = adapter.filterExclusiveBooks();

            if (books.isEmpty) {
              print('🫗🫗No Books left...🫗🫗');
              break;
            }
            for (int i = 0; i < books.length; i++) {
              print(
                  '${i + 1} 📕: Title: ${books[i].title}, Author: ${books[i].author}, Type: ${books[i].type.name}, Amount Of Pages: ${books[i].pages} ${books[i].exclusive ? ', 🌟🌟Exclusive🌟🌟' : ''}');
              if (i + 1 == books.length) print('\n');
            }
            break;
          case '4':
            List<Book> books = adapter.filterOldBooks();
            if (books.isEmpty) {
              print('🫗🫗No Books left...🫗🫗');
              break;
            }
            for (int i = 0; i < books.length; i++) {
              print(
                  '${i + 1} 📕: Title: ${books[i].title}, Author: ${books[i].author}, Type: ${books[i].type.name}, Amount Of Pages: ${books[i].pages} ${books[i].exclusive ? ', 🌟🌟Exclusive🌟🌟' : ''}');
              if (i + 1 == books.length) print('\n');
            }
            break;
          case '5':
            break;
          default:
            false;
        }
      case '3':
        // search for a book
        while (true) {
          print('Enter Title of a Book: ');
          String? searchText = stdin.readLineSync();
          if (searchText == null || searchText.trim().isEmpty) {
            false;
          } else {
            List<Book> books = searchByTitle.search(searchText);
            print('🔎🔎Search Results:🔎🔎\n');
            if (books.isEmpty) {
              print('🆑🔎No Books Found:🔎🆑\n');
            }
            for (int i = 0; i < books.length; i++) {
              print(
                  '${i + 1} 📕: Title: ${books[i].title}, Author: ${books[i].author}, Type: ${books[i].type.name}, Amount Of Pages: ${books[i].pages} ${books[i].exclusive ? ', 🌟🌟Exclusive🌟🌟' : ''}');
            }
            break;
          }
        }
        break;

      case '4':
        List<Book> books = singleton.booksState;
        if (books.isEmpty) {
          print('🫗🫗No Books left...🫗🫗');
          break;
        }
        for (int i = 0; i < books.length; i++) {
          print(
              '${i + 1} 📕: Title: ${books[i].title}, Author: ${books[i].author}, Type: ${books[i].type.name}, Amount Of Pages: ${books[i].pages} ${books[i].exclusive ? ', 🌟🌟Exclusive🌟🌟' : ''}');
          if (i + 1 == books.length) print('\n');
        }
        while (true) {
          print(
              'Whould you prefer to buy one of these?\nWrite an NUMBER Of Product or enter "0" to LEAVE');
          String? index = stdin.readLineSync();

          if (index == null || index.isEmpty) {
            false;
          } else {
            try {
              if (int.parse(index) == 0) break;

              if (int.parse(index) > books.length || int.parse(index) < 0) {
                false;
              } else {
                BookStoreFacade facade =
                    BookStoreFacade(singleton, books[int.parse(index) - 1].id);
                while (true) {
                  facade.buy();
                  String? answer = stdin.readLineSync();
                  if (answer == null || answer.isEmpty) {
                    false;
                  } else {
                    if (answer.toLowerCase().trim() != 'no' &&
                        answer.toLowerCase().trim() != 'yes') {
                      false;
                    } else {
                      if (answer.toLowerCase().trim() == 'yes') {
                        print(
                            '💸💸==============Successfully Bought!!==============💸💸');
                        break;
                      } else {
                        break;
                      }
                    }
                  }
                }
              }
            } on FormatException {
              false;
            }
          }
          break;
        }
      default:
        false;
    }
  }
}
