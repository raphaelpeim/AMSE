import 'package:flutter/material.dart';
import 'home.dart';

class Exercice1 extends StatefulWidget {
  Exercice1({Key key}) : super(key: key);

  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice1> {
  var _assetName = 'images/starwars.jpg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Exercice 1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
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
            title: Text('Exercice 1'),
          ),
          body: Center(child: Image(image: AssetImage(_assetName))),
        ));
  }
}
