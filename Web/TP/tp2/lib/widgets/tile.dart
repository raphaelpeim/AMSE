import 'package:flutter/material.dart';

class Tile {
  Image image;
  int divisions;
  Alignment alignment;

  Tile({this.image, this.divisions, this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
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
    );
  }
}
