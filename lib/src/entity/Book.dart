class Book {
  final String title;
  final String author;
  final String isbn;
  final String thumbnail;

  Book({this.title, this.author, this.isbn, this.thumbnail});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      isbn: json['isbn'],
      thumbnail: json['thumbnail'],
    );
  }
}