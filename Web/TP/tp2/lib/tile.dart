import 'package:flutter/material.dart';

class Tile {
  Image image;
  Alignment alignment;

  Tile({this.image, this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1 / 3,
            heightFactor: 1 / 3,
            child: image,
          ),
        ),
      ),
    );
  }
}
