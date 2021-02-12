import 'package:flutter/material.dart';
import 'home.dart';

class Exercice5b extends StatefulWidget {
  Exercice5b({Key key}) : super(key: key);

  @override
  _Exercice5bState createState() => _Exercice5bState();
}

class _Exercice5bState extends State<Exercice5b> {
  List<Color> tilesColor = <Color>[
    Colors.blue[800],
    Colors.green[200],
    Colors.green,
    Colors.red[300],
    Colors.purple[900],
    Colors.blue[900],
    Colors.red[900],
    Colors.green[300],
    Colors.blue[400],
  ];

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
          title: Text('Exercice 5b'),
        ),
        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              var tileNumber = index + 1;

              return Container(
                padding: const EdgeInsets.all(8),
                child: Center(child: Text('Tile $tileNumber')),
                color: tilesColor[index],
              );
            })));
  }
}
