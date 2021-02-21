import 'package:flutter/material.dart';
import 'tile.dart';

class Exercice5c extends StatelessWidget {
  final List<List<double>> positions = <List<double>>[
    [-1, -1],
    [0, -1],
    [1, -1],
    [-1, 0],
    [0, 0],
    [1, 0],
    [-1, 1],
    [0, 1],
    [1, 1],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exercice 5b'),
        ),
        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(5),
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              Tile tile = new Tile(
                  image: Image(image: AssetImage('images/starwars.jpg')),
                  alignment:
                      Alignment(positions[index][0], positions[index][1]));

              return Container(
                padding: const EdgeInsets.all(2),
                child: tile.croppedImageTile(),
              );
            })));
  }
}
