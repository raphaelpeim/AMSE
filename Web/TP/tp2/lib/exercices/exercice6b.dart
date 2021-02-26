import 'package:flutter/material.dart';
import 'package:tp2/widgets/board.dart';

class Exercice6b extends StatefulWidget {
  Exercice6b({Key key}) : super(key: key);

  @override
  _Exercice6bState createState() => _Exercice6bState();
}

class _Exercice6bState extends State<Exercice6b> {
  Board board = Board(game: true, tilesNumber: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 6b'),
      ),
      body: Column(children: <Widget>[
        board.build(),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (board.tilesNumber > 2) {
                        board.tilesNumber--;
                      }
                    });
                  },
                  child: Text('-')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (board.tilesNumber < 10) {
                        board.tilesNumber++;
                      }
                    });
                  },
                  child: Text('+'))
            ])
      ]),
    );
  }
}
