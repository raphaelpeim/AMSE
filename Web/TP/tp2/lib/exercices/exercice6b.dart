import 'package:flutter/material.dart';
import 'package:tp2/widgets/board.dart';

class Exercice6b extends StatefulWidget {
  Exercice6b({Key key}) : super(key: key);

  @override
  _Exercice6bState createState() => _Exercice6bState();
}

class _Exercice6bState extends State<Exercice6b> {
  Board board = Board(tilesNumber: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 6b'),
      ),
      body: board.build(),
    );
  }
}
