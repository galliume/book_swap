class Book {
  final String title;
  final String author;

  Book({this.title, this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
    );
  }
}