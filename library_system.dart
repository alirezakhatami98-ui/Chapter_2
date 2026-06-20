class Book {
  String title, author;
  bool isBorrowed = false;

  Book(this.title, this.author);

  void borrow() {
    if (isBorrowed) {
      print('Book is already borrowed!');
    } else {
      isBorrowed = true;
    }
  }

  void returnBook() {
    if (!isBorrowed) {
      print('Book is not currently borrowed!');
    } else {
      isBorrowed = false;
    }
  }
}

class Member {
  String name, memberId;

  Member(this.name, this.memberId);
}

class Library {
  List<Book> books = [];
  List<Member> members = [];

  void addBook(Book book) {
    books.add(book);
    print('Book "${book.title}" by ${book.author} added to the library.');
  }

  void registerMember(Member member) {
    members.add(member);
    print('Member "${member.name}" with ID "${member.memberId}" registered.');
  }

  Book? findBook(String title) {
    for (var book in books) {
      if (book.title == title) {
        return book;
      }
    }
    print('Book not found');
    return null;
  }

  Member? findMember(String memberId) {
    for (var member in members) {
      if (member.memberId == memberId) {
        return member;
      }
    }
    print('Member not found');
    return null;
  }

  void borrowBook(String title, String memberId) {
    // Find the book by title
    Book? bookToBorrow = findBook(title);

    if (bookToBorrow == null) {
      print('Book not found!');
      return;
    }

    if (bookToBorrow.isBorrowed) {
      print('Book is already borrowed!');
      return;
    }

    // Find the member by ID
    Member? borrowingMember = findMember(memberId);

    if (borrowingMember == null) {
      print('Member not found!');
      return;
    }

    // Borrow the book
    bookToBorrow.borrow();
    print('${borrowingMember.name} has borrowed "${bookToBorrow.title}"');
  }

  void returnBook(String title) {
    // Find the book by title
    Book? bookToReturn = findBook(title);

    if (bookToReturn == null) {
      print('Book not found!');
      return;
    }

    if (!bookToReturn.isBorrowed) {
      print('Book is not currently borrowed!');
      return;
    }

    // Return the book
    bookToReturn.returnBook();
    print('Book "${bookToReturn.title}" has been returned to the library.');
  }

  void listBooks() {
    if (books.isEmpty) {
      print('No books in the library!');
      return;
    }
    for (var book in books) {
      String status = book.isBorrowed ? 'Borrowed' : 'Available';
      print('Title: ${book.title}, Author: ${book.author}, Status: $status');
    }
  }
}

void main() {
  Library library = Library();

  // Add some books
  library.addBook(Book('The Great Gatsby', 'F. Scott Fitzgerald'));
  library.addBook(Book('To Kill a Mockingbird', 'Harper Lee'));

  // Register some members
  library.registerMember(Member('Alice', 'M001'));
  library.registerMember(Member('Bob', 'M002'));

  // List all books
  print('\nAll Books:');
  library.listBooks();

  // Borrow a book
  print('\nBorrowing "The Great Gatsby" by Alice:');
  library.borrowBook('The Great Gatsby', 'M001');

  // List all books again to see the updated status
  print('\nAll Books after borrowing:');
  library.listBooks();

  // Return the book
  print('\nReturning "The Great Gatsby":');
  library.returnBook('The Great Gatsby');

  // List all books again to see the updated status
  print('\nAll Books after returning:');
  library.listBooks();
}
