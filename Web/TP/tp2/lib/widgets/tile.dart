import 'package:flutter/material.dart';

class Tile {
  int id;
  Image image;
  int divisions;
  Alignment alignment;

  Tile({this.id, this.image, this.divisions, this.alignment});

  Widget build() {
    return Container(
        margin: const EdgeInsets.all(2),
        color: Colors.grey,
        child: image == null
            ? Center(child: Text('Tile $id'))
            : FittedBox(
                fit: BoxFit.fill,
                child: ClipRect(
                  child: Container(
                    child: Align(
                      alignment: this.alignment,
                      widthFactor: 1 / divisions,
                      heightFactor: 1 / divisions,
                      child: image,
                    ),
                  ),
                ),
              ));
  }
}
