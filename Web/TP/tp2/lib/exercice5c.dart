import 'package:flutter/material.dart';
import 'dart:math';
import 'tile.dart';

class Exercice5c extends StatelessWidget {
  final tilesNumber = 5;

  @override
  Widget build(BuildContext context) {
    List<List<double>> positions = getPositions(tilesNumber);

    return Scaffold(
        appBar: AppBar(
          title: Text('Exercice 5c'),
        ),
        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(5),
            crossAxisCount: tilesNumber,
            children: List.generate(pow(tilesNumber, 2), (index) {
              Tile tile = new Tile(
                  image: Image(image: AssetImage('images/starwars.jpg')),
                  divisions: tilesNumber,
                  alignment:
                      Alignment(positions[index][0], positions[index][1]));

              return Container(
                padding: const EdgeInsets.all(2),
                child: tile.croppedImageTile(),
              );
            })));
  }

  List<List<double>> getPositions(int n) {
    List<List<double>> positions = <List<double>>[];
    for (double i = -1; i <= 1; i += 2 / (n - 1)) {
      for (double j = -1; j <= 1; j += 2 / (n - 1)) {
        positions.add([j, i]);
      }
    }

    return positions;
  }
}
