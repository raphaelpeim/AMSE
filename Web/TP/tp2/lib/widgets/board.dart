import 'package:flutter/material.dart';
import 'dart:math';
import 'tile.dart';

class Board {
  int tilesNumber;
  bool game;
  String imageSrc;
  List<List<double>> positions;
  // List<Tile> tiles;

  Board({this.tilesNumber, this.game, this.imageSrc});

  Widget build() {
    positions = getPositions(tilesNumber);

    return GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        crossAxisCount: tilesNumber,
        children: List.generate(pow(tilesNumber, 2), (index) {
          Tile tile = new Tile(
              id: index,
              selected: (game && index == 0) ? true : false,
              image:
                  imageSrc == null ? null : Image(image: AssetImage(imageSrc)),
              divisions: tilesNumber,
              alignment: Alignment(positions[index][0], positions[index][1]));

          // tiles.add(tile);

          return tile.build();
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
