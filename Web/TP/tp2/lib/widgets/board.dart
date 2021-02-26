import 'package:flutter/material.dart';
import 'dart:math';
import 'tile.dart';

class Board {
  int tilesNumber;
  String imageSrc;
  List<List<double>> positions;

  Board({this.tilesNumber, this.imageSrc});

  Widget build() {
    positions = getPositions(tilesNumber);

    return GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        crossAxisCount: tilesNumber,
        children: List.generate(pow(tilesNumber, 2), (index) {
          Tile tile = new Tile(
              id: index,
              image:
                  imageSrc == null ? null : Image(image: AssetImage(imageSrc)),
              divisions: tilesNumber,
              alignment: Alignment(positions[index][0], positions[index][1]));

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
