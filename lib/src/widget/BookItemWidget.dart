import 'package:flutter/material.dart';

class BookItemWidget extends StatefulWidget {
  BookItemWidget({Key key, this.title}) : super(key: key);

  final String title;

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
          width: 48.0,
          height: 48.0,
          child: Text(widget.title)
        ),
    );
  }
}