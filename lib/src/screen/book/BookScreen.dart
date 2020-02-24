import 'package:flutter/material.dart';
import 'BookItemWidget.dart';
import 'dart:async';

class BookScreen extends StatefulWidget {
  Future<List> books;

  BookScreen({ this.books });

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {

  @override
  Widget build(BuildContext context) {
        return FutureBuilder(
            future: this.widget.books,
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
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new BookItemWidget(book: snapshot.data[index])
                            ],
                          );
                        });
                    }
                  }

                return new Text("an error has occured");
            });
      }
  }