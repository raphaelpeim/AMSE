import 'package:flutter/material.dart';
import 'exercice1.dart';
import 'exercice2.dart';
import 'exercice3.dart';
import 'exercice4.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final _title = 'TP2';
  final List<String> subtitles = <String>[
    'Show an image',
    'Transform an image',
    'Menu and navigation',
    'Show a tile',
    // 'Generate a tile board game',
    // 'Animate a tile',
    // 'Taquin game',
  ];
  final List<Widget> widgets = <Widget>[
    Exercice1(),
    Exercice2(),
    Exercice3(),
    Exercice4(),
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
                var exerciceNumber = index + 1;

                return Card(
                  child: ListTile(
                    title: Text('Exercice $exerciceNumber'),
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
