import 'package:flutter/material.dart';
import 'slider.dart';
import 'home.dart';

class Exercice2 extends StatefulWidget {
  Exercice2({Key key}) : super(key: key);

  @override
  _Exercice2State createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  var _assetName = 'images/starwars.jpg';
  var _currentValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeWidget(),
                ),
              );
            },
          ),
          title: Text('Exercice 2'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(_assetName)),
              Table(
                columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(4)},
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [Text('Rotate X : '), MySlider()]),
                  TableRow(children: [Text('Rotate Z : '), MySlider()]),
                  TableRow(children: [Text('Scale : '), MySlider()]),
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
