import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  final String asset;

  MyImage({Key key, this.asset}) : super(key: key);

  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  double x = 0.2;
  double y = 0.2;
  double z = 0.2;

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..rotateX(x)
          ..rotateY(y)
          ..rotateZ(z),
        child: Container(child: Image(image: AssetImage(widget.asset))));
  }

  void setX(double newX) {
    setState(() {
      x = newX;
    });
  }

  void setY(double newY) {
    setState(() {
      y = newY;
    });
  }

  void setZ(double newZ) {
    setState(() {
      z = newZ;
    });
  }
}
