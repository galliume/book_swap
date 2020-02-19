import 'package:flutter/material.dart';
import 'controller/HomePageController.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookSwap',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePageController(title: 'Swap locally your books !'),
    );
  }
}