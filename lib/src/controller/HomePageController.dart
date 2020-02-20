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
  Future<List> futureBook;

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
        child:ListView.builder(
          itemCount: 10, //@TODO make it dynamic with the Future<> ?
          itemBuilder: (context, index) {
            return FutureBuilder(
              future: futureBook,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  case ConnectionState.done:
                    if (snapshot.hasData && snapshot.data.length > index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new BookItemWidget(book: snapshot.data[index])
                        ],
                      );
                    } else {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text("vers l'infini et au delà")
                          ]
                      );
                    }
                }
                return null;
              }
            );
          },
        ),
      ),
    );
  }
}