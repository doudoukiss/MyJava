public class Main {
    public static void main(String[] args) {
      String myWord = "Hello";
      Book myBook = new Book("My Book");
      // Create `Container` references and print statement below...
      Container<String> wordContainer = new Container<String>(myWord);
      Container<Book> bookContainer = new Container<Book>(myBook);
      System.out.println(wordContainer.getData());
      System.out.println(bookContainer.getData());

      int myNumber = 24;
      String bookName = "Hello Book!";

      Container<Integer> containerRetriever = new Container<Integer>(myNumber);
      Book bookRetriever = new Book(bookName);
      System.out.println(containerRetriever.retrieveData());
      System.out.println(bookRetriever.retrieveData());
    }
  }
