import 'package:flutter/material.dart';
import 'home.dart';

class Exercice3 extends StatefulWidget {
  Exercice3({Key key}) : super(key: key);

  @override
  _Exercice3State createState() => _Exercice3State();
}

class _Exercice3State extends State<Exercice3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Exercice 3',
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
              title: Text('Exercice 3'),
            ),
            body: Center(child: Text('L\'exerice 3 correspond à l\'accueil'))));
  }
}
