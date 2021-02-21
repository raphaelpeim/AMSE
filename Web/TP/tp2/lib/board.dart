import 'package:flutter/material.dart';
import 'dart:math';
import 'tile.dart';

class Board {
  int tilesNumber = 3;

  Widget build() {
    List<List<double>> positions = getPositions(tilesNumber);

    return GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        crossAxisCount: tilesNumber,
        children: List.generate(pow(tilesNumber, 2), (index) {
          Tile tile = new Tile(
              image: Image(image: AssetImage('images/starwars.jpg')),
              divisions: tilesNumber,
              alignment: Alignment(positions[index][0], positions[index][1]));

          return Container(
            padding: const EdgeInsets.all(2),
            child: tile.croppedImageTile(),
          );
        }));
  }

  List<List<double>> getPositions(n) {
    List<List<double>> positions = <List<double>>[];

    for (double i = -1; i <= 1; i += 2 / (n - 1)) {
      for (double j = -1; j <= 1; j += 2 / (n - 1)) {
        positions.add([j, i]);
      }
    }

    return positions;
  }
}
