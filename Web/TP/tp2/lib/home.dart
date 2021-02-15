import 'package:flutter/material.dart';
import 'exercice1.dart';
import 'exercice2.dart';
import 'exercice3.dart';
import 'exercice4.dart';
import 'exercice5a.dart';
import 'exercice5b.dart';

class HomeWidget extends StatelessWidget {
  final String _title = 'TP2';
  final List<String> titles = <String>[
    'Exercice 1',
    'Exercice 2',
    'Exercice 3',
    'Exercice 4',
    'Exercice 5a',
    'Exercice 5b',
  ];
  final List<String> subtitles = <String>[
    'Show an image',
    'Transform an image',
    'Menu and navigation',
    'Display a tile',
    'Grid of colored tiles',
    'Grid with an image',
  ];
  final List<Widget> widgets = <Widget>[
    Exercice1(),
    Exercice2(),
    Exercice3(),
    Exercice4(),
    Exercice5a(),
    Exercice5b(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('TP2'),
            ),
            body: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: subtitles.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(titles[index]),
                    subtitle: Text(subtitles[index]),
                    trailing: Icon(Icons.play_arrow),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => widgets[index],
                        ),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )));
  }
}
