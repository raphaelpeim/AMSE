import 'package:flutter/material.dart';
import '../widgets/image.dart';
import '../widgets/slider.dart';

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
                      callback: setX,
                    )
                  ]),
                  TableRow(children: [
                    Text('Rotate Y : '),
                    MySlider(
                      callback: setY,
                    )
                  ]),
                  TableRow(children: [
                    Text('Rotate Z : '),
                    MySlider(
                      callback: setZ,
                    )
                  ]),
                  TableRow(children: [
                    Text('Scale : '),
                    MySlider(
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
      image.x = newX / 100 * 6.28;
    });
  }

  void setY(double newY) {
    setState(() {
      image.y = newY / 100 * 6.28;
    });
  }

  void setZ(double newZ) {
    setState(() {
      image.z = newZ / 100 * 6.28;
    });
  }

  void setS(double newS) {
    setState(() {
      image.s = 1 - newS / 100;
    });
  }
}
