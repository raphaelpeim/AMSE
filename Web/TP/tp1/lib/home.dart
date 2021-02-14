import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Text(
            'Bienvenue !\n',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
          Text(
            'En cliquant sur "media" dans la barre de navigation, vous avez accès à plusieurs catégories de médias.\n\n Ensuite dans chacune des catégories, il y a une liste d\'éléments sur lesquels vous pouvez cliquer pour en savoir plus',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )
        ]));
  }
}
