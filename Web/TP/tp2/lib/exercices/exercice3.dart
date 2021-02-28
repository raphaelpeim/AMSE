import 'package:flutter/material.dart';
import 'exercice1.dart';
import 'exercice2.dart';
import 'exercice4.dart';
import 'exercice5a.dart';
import 'exercice5b.dart';
import 'exercice5c.dart';
import 'exercice6a.dart';
import 'exercice6b.dart';
import 'exercice7.dart';

class Exercice3 extends StatelessWidget {
  final String _title = 'TP2';
  final List<String> titles = <String>[
    'Exercice 1',
    'Exercice 2',
    'Exercice 4',
    'Exercice 5a',
    'Exercice 5b',
    'Exercice 5c',
    'Exercice 6a',
    'Exercice 6b',
    'Exercice 7',
  ];
  final List<String> subtitles = <String>[
    'Show an image',
    'Transform an image',
    'Display a tile',
    'Grid of colored tiles',
    'Grid based on an image',
    'Grid with size setable',
    'Switch two tiles',
    'Grid Test',
    'Taquin game',
  ];
  final List<Widget> widgets = <Widget>[
    Exercice1(),
    Exercice2(),
    Exercice4(),
    Exercice5a(),
    Exercice5b(),
    Exercice5c(),
    Exercice6a(),
    Exercice6b(),
    Exercice7(),
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
