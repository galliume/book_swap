import 'package:flutter/material.dart';

import '../screen/book/BookScreen.dart';
import '../service/BookService.dart';

class HomePageController extends StatefulWidget {
  HomePageController({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageControllerState createState() => _HomePageControllerState();
}

class _HomePageControllerState extends State<HomePageController> {
  BookService bookService = new BookService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: BookScreen(books:bookService.fetchBooks())
      ),
    );
  }
}