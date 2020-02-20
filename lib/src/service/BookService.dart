import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entity/Book.dart';

class BookService {

  Future<List> fetchBooks() async {
    final response = await http.get(
      "http://192.168.1.30:8000/api/books",
      headers: {"X-AUTH-TOKEN": "SomeNaiveApiToken_5e4c563a44b34"}
    );

    if (200 == response.statusCode) {
      List<dynamic> body = json.decode(response.body);
      List<Book> books = new List();

      body.forEach((element) {
        books.add(Book.fromJson(element));
      });

      return books;
    } else {
      throw Exception("Unable to load book");
    }
  }

}