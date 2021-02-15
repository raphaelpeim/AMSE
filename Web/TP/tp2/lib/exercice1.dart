import 'package:flutter/material.dart';

class Exercice1 extends StatelessWidget {
  final String _assetName = 'images/starwars.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 1'),
      ),
      body: Center(child: Image(image: AssetImage(_assetName))),
    );
  }
}
