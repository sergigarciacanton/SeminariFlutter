class Book {
  final String title;
  final String imageLink;
  final double averageRating;
  final int pageCount;

  Book({this.title, this.imageLink, this.averageRating, this.pageCount});

  factory Book.fromJson(dynamic json) {
    return Book(
        title: json['title'] as String,
        imageLink: json['imageLinks']['thumbnail'] as String,
        averageRating: json['averageRating'] as double,
        pageCount: json['pageCount'] as int);
  }

  static List<Book> booksFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Book.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Book {title: $title, imageURL: $imageLink, rating: $averageRating, pages: $pageCount}';
  }
}