# Name of final project: BookStore
# Group: SE-2217
# Team members: Alisher Tokesh, Rakhat Zhaishylyk, Nurali Makhmutzhan.

# Project Information:
The project involves the development and management of a digital bookstore.

# Idea of the Project:
The project aims to create a user-friendly platform for customers to explore, search for, and purchase books. 

# Purpose of the Work:
* Provide a convenient platform for book enthusiasts to discover and purchase books.
* Streamline the management of inventory, orders, and customer data.
* Encourage a culture of reading by making a diverse range of books accessible to abroad audience.
* Generate revenue through book sales, potentially expanding to include partnerships with publishers or hosting events.

# Objectives of the Work:
* Develop a user-friendly and responsive website or application to make the bookstore accessible to a wide audience.
* Populate the catalog with a diverse range of books, covering various genres and topics to cater to different interests.
* Implement a smooth shopping experience, allowing users to add and remove items from their cart easily and complete the purchase with a straightforward checkout process.
* Integrate a secure payment gateway to facilitate online transactions, providing users with various payment options.

# Main body:

## Strategy Pattern

#### Files
- `SearchStrategy.dart`
- `SearchByAuthor.dart`
- `SearchByTitle.dart`

#### Description
In BookStore, the strategy template allows you to dynamically select search strategies. This model separates the strategic decision-making process from specific strategies, allowing for flexible changes.

#### Implementation in Project
- **`SearchStrategy` Class**: The core of the strategy pattern, defining the `SearchStrategy` method.
- **`SearchByAuthor` and `SearchByTitle` Classes**: Concrete implementations of the `SearchStrategy`, each offering a unique approach to searching books.

#### Usage
- Allows the user to select a real-time search algorithm by switching between Author search and book title search
- Increases the ability to find the right book.

#### Benefit
The Strategy pattern introduces a significant level of flexibility in search. This allows the user to easily change their approach of finding books.

![image](https://github.com/Tsarkashrk/sdp-final/assets/129576900/ec221825-31ce-4da2-8197-809fbdef30d5)

## Factory Method Pattern

#### Files
- `Book.dart`
- `BookStore.dart`
- `FictionBook.dart`
- `FairyTailBook.dart`
- `FictionBookStore.dart` 
- `FairyTailBookStore.dart`

#### Description
The Factory Method pattern in BookStore is crucial for the creation of essences of books. It defines a standard interface for creating objects while allowing for flexibility in the actual objects being created.

#### Implementation in Project
- **`Book` Class**: Outlines the structure expected of a book.
- **`FairyTailBook` and `FictionBook` Classes**: Concrete implementations of the `Book` interface, tailored for specific books.
- **`FictionBookStore` and `FairyTailBookStore` Classes**: These factories handle the creation of fairytail and fiction books, respectively.

#### Usage
- Facilitates the dynamic creation of books with specified strategies, keeping the creation process consistent yet customizable.
- Enhances the system's ability to grow and adapt to new types of teams or strategies.

#### Benefit
The Factory Method pattern improves the code's scalability and maintainability by centralizing book creation and allowing for future expansions without significant changes to the existing codebase.

![image](https://github.com/Tsarkashrk/sdp-final/assets/129576900/697bb50a-3de0-462f-9df7-10d8f5231408)

## Singleton Pattern

#### File
- `Singleton.dart`

#### Description
The Singleton pattern in BookStore is exemplified by the `Singleton` class. This pattern ensures that a class has only one instance and provides a global point of access to it. It is particularly useful for managing shared resources or coordinating actions across the system.

#### Implementation in Project
- **`Singleton` Class**: This class is responsible for managing the store.
- **Method `addToState()`**: This is a method that adds the transferred book to the bookstate list.
- **Method `_internal()`**: Guarantees that only one instance of the store is created. If the instance doesn't exist, it creates; if it does, the existing instance is returns.

#### Usage
- `Singleton` acts as a central point for managing store.
- Ensures consistent and coordinated handling of store operations, such as adding book.

#### Benefit
The Singleton pattern is crucial for maintaining a single, consistent state of the store throughout the application. It prevents the complications and errors that could arise from having multiple instances of the store.

![image](https://github.com/Tsarkashrk/sdp-final/assets/129576900/664d3443-1fa6-44ee-8c7a-56bdc4bba766)

## Decorator Pattern

#### Files
- `BookDecorator.dart` 
- `CalculateDecorator.dart`

#### Description
The Decorator pattern in BookStore is used to dynamically add new behaviors to objects without changing their original class. 

#### Implementation in Project
- **`BookDecorator` (Abstract Class)**: Implements the `Book` class and contains a reference to a `Book` object. This class serves as the base for further extensions.
- **`CalculateDecorator` Class**: Extends `Book Decorator`, enhancing the base strategy with counting the price. It overrides the `calculatePrice()` method to count.

#### Usage
- This pattern allows to apply additional tactical elements like calculating price to existing strategies without creating entirely new strategy classes.
- 
#### Benefit
The Decorator pattern offers a flexible approach to modifying object behavior. It promotes code reusability and helps in maintaining single responsibility in classes by allowing modifications without altering the original class's code.

![image](https://github.com/Tsarkashrk/sdp-final/assets/129576900/8a197a58-38d0-432b-8eee-2e07f2db5395)

## Adapter Pattern

#### Files
- `FilterSystem.dart`
- `BookAdapter.dart`

#### Description
The Adapter pattern is used to allow two incompatible interfaces to work together. In this case, the isolated `booksState` class where acess denied, it manifests itself through interaction with `BookAdapter`.

#### Implementation in Project
- **`Singleton` Interface**: Expects `booksState` class which is isolated class.
- **`BookAdapter` Class**: This adapter class implements `FilterSystem` and provides `bookState` class to the `Singleton`.
- **`FilterSystem` Class**: This class has `booksState` class.

#### Benefit
This approach allows the `Team` to be controlled by a `Trainer` interface, regardless of the language difference, making the system flexible and adaptable to different languages and command styles.

![image](https://github.com/Tsarkashrk/sdp-final/assets/129576900/71242d6f-f434-4fcc-91df-bb0c30331341)

## Facade Pattern

#### Files
- `BookStoreFacade.dart`

#### Description
The Facade pattern is used to isolate clients from components of a complex subsystem.

#### Implementation in Project
- **`BookStoreFacade` Class**: `BookStoreFacade` contains `Adapter`, `Decorator`, `Factory`, `Singleton` classes and creating a simple interface to interact with them.

#### Benefit
The Facade pattern is used to isolate clients from components of a complex subsystem.

![image](https://github.com/Tsarkashrk/sdp-final/assets/129576900/f54d6d3c-4892-4e8c-98ff-43f7b8b12429)

## Conclusion

### Key Points of BookStore

BookStore integrates several design patterns to enhance the book store experience. The key patterns used include Adapter, Facade, Factory Method, Singleton, Strategy, and Decorator patterns, each contributing to the system's flexibility, usability, and effectiveness.

### Project Outcomes and Challenges Faced

The project successfully achieved its goal of providing a user-friendly and insightful online book store. Users can easily find their best books and manage with them on this platform.

However, the project encountered challenges, especially in balancing the complexity of design patterns with the need for a simple user interface. Ensuring realistic simulations and integrating various functionalities smoothly were among the significant hurdles overcome during the development process.

### Future Improvements

For future iterations of BookStore, several enhancements are planned:

1. **User Reviews and Ratings.
2. **User Accounts and Profiles:
3. **Mobile App Development:
