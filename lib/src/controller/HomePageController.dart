import 'dart:async';
import 'package:flutter/material.dart';

import '../widget/BookItemWidget.dart';
import '../entity/Book.dart';
import '../service/BookService.dart';

class HomePageController extends StatefulWidget {
  HomePageController({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageControllerState createState() => _HomePageControllerState();
}

class _HomePageControllerState extends State<HomePageController> {
  Future<Book> futureBook;

  @override
  void initState() {
    super.initState();
    BookService bookService = new BookService();
    futureBook = bookService.fetchBooks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Book>(
          future: futureBook,
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new BookItemWidget(book: snapshot.data)
                ],
              );
            } else {
              return Text("${snapshot.error}");
            }
          },
        ),
      ),
    );
  }
}