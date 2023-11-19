import '../adapter/book_adapter.dart';
import '../decorator/book_decorator.dart';
import '../factory/store_factory.dart';
import '../singleton/singleton.dart';

// Facade - Изолирует клиентов от компонентов сложной подсистемы.
class BookStoreFacade {
  final Singleton singleton;
  final String id;

  BookStoreFacade(this.singleton, this.id);

  Book getBookFromState() {
    return singleton.booksState.firstWhere((element) => element.id == id);
  }

  // Decorator - позволяет динамически добавлять объектам новую функциональность, оборачивая их в полезные «обёртки».
  void buy() async {
    Book book = getBookFromState();
    var fairyTailPrice = CalculateDecorator(book);
    print(
        '===============🛒🛒Price: ${fairyTailPrice.calculatePrice()}, Ready to Buy? 🛒🛒===============');
  }
}
