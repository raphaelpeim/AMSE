import 'package:flutter/material.dart';
import 'home.dart';

class Exercice4 extends StatefulWidget {
  Exercice4({Key key}) : super(key: key);

  @override
  _Exercice4State createState() => _Exercice4State();
}

class _Exercice4State extends State<Exercice4> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Exercice 4',
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
              title: Text('Exercice 4'),
            ),
            body: Center(child: Text('Text'))));
  }
}
