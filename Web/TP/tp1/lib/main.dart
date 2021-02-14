import 'package:flutter/material.dart';
import 'navBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavBar(),
    );
  }
}
