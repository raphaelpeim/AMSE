import 'package:flutter/material.dart';
import 'board.dart';

class Exercice5c extends StatefulWidget {
  Exercice5c({Key key}) : super(key: key);

  @override
  _Exercice5cState createState() => _Exercice5cState();
}

class _Exercice5cState extends State<Exercice5c> {
  final Board board = Board();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5c'),
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
