import 'package:flutter/material.dart';

class MyImage {
  String asset;

  MyImage({Key key, this.asset});

  double x = 0;
  double y = 0;
  double z = 0;
  double s = 1;

  Widget build() {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..rotateX(x)
          ..rotateY(y)
          ..rotateZ(z),
        child:
            Transform.scale(scale: s, child: Image(image: AssetImage(asset))));
  }
}
