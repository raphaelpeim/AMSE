import 'package:flutter/material.dart';
import 'image.dart';
import 'slider.dart';

class Exercice2 extends StatefulWidget {
  Exercice2({Key key}) : super(key: key);

  @override
  _Exercice2State createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  Widget image = MyImage(asset: 'images/starwars.jpg');
  bool _currentValue = false;

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
              image,
              Table(
                columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(4)},
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Text('Rotate X : '),
                    MySlider(
                      image: image,
                      max: 314,
                      divisions: 314,
                    )
                  ]),
                  TableRow(children: [
                    Text('Rotate Y : '),
                    MySlider(
                      image: image,
                      max: 314,
                      divisions: 314,
                    )
                  ]),
                  TableRow(children: [
                    Text('Rotate Z : '),
                    MySlider(
                      image: image,
                      max: 314,
                      divisions: 314,
                    )
                  ]),
                  TableRow(children: [
                    Text('Scale : '),
                    MySlider(
                      image: image,
                      max: 314,
                      divisions: 314,
                    )
                  ]),
                  TableRow(children: [
                    Text('Mirror : '),
                    Checkbox(
                      value: _currentValue,
                      onChanged: (bool newValue) {
                        setState(() {
                          _currentValue = newValue;
                        });
                      },
                    )
                  ]),
                ],
              ),
            ],
          ),
        ));
  }
}
