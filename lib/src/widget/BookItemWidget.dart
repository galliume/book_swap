import 'package:flutter/material.dart';

import '../entity/Book.dart';

class BookItemWidget extends StatefulWidget {
  BookItemWidget({Key key, this.book}) : super(key: key);

  final Book book;

  @override
  _BookItemWidget createState() => _BookItemWidget();
}

class _BookItemWidget extends State<BookItemWidget> {

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.amber[600],
          width: 150,
          height: 48.0,
          child: Align(
            alignment: Alignment.center,
            child: Text(widget.book.title + ' - ' + widget.book.author)
          )
        ),
    );
  }
}