import 'package:flutter/material.dart';
import 'image.dart';
import 'slider.dart';

class Exercice2 extends StatefulWidget {
  Exercice2({Key key}) : super(key: key);

  @override
  _Exercice2State createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  MyImage image = MyImage(asset: 'images/starwars.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exercice 2'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image.build(),
              Table(
                columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(4)},
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Text('Rotate X : '),
                    MySlider(
                      max: 628,
                      divisions: 628,
                      callback: setX,
                    )
                  ]),
                  TableRow(children: [
                    Text('Rotate Y : '),
                    MySlider(
                      max: 628,
                      divisions: 628,
                      callback: setY,
                    )
                  ]),
                  TableRow(children: [
                    Text('Rotate Z : '),
                    MySlider(
                      max: 628,
                      divisions: 628,
                      callback: setZ,
                    )
                  ]),
                  TableRow(children: [
                    Text('Scale : '),
                    MySlider(
                      max: 100,
                      divisions: 100,
                      callback: setS,
                    )
                  ]),
                ],
              ),
            ],
          ),
        ));
  }

  void setX(double newX) {
    setState(() {
      image.x = newX / 100;
    });
  }

  void setY(double newY) {
    setState(() {
      image.y = newY / 100;
    });
  }

  void setZ(double newZ) {
    setState(() {
      image.z = newZ / 100;
    });
  }

  void setS(double newS) {
    setState(() {
      image.s = newS / 100;
    });
  }
}
