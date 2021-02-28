import 'package:flutter/material.dart';

import 'board.dart';

class Tile {
  int id;
  bool selected;
  Image image;
  int divisions;
  Alignment alignment;

  Tile({this.id, this.selected, this.image, this.divisions, this.alignment});

  BoxDecoration regularDecoration = BoxDecoration(color: Colors.grey);
  BoxDecoration selectedDecoration = BoxDecoration(
      color: Colors.white, border: Border.all(color: Colors.red, width: 2));

  Widget build() {
    return GestureDetector(
      child: Container(
          margin: const EdgeInsets.all(2),
          decoration: (selected != null && selected)
              ? selectedDecoration
              : regularDecoration,
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
                )),
      onTap: () {
        print('A compléter');
      },
    );
  }
}
