import 'package:flutter/material.dart';
import 'books.dart';
import 'films.dart';
import 'series.dart';
import 'sports.dart';

class Medias extends StatelessWidget {
  final List<Icon> icons = <Icon>[
    Icon(Icons.menu_book),
    Icon(Icons.local_movies),
    Icon(Icons.subscriptions),
    Icon(Icons.sports),
  ];
  final List<String> names = <String>[
    'Livres',
    'Films',
    'Series',
    'Sports',
  ];
  final List<Widget> widgets = <Widget>[
    BookWidget(),
    FilmWidget(),
    SerieWidget(),
    SportWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: List.generate(icons.length, (index) {
        return ListTile(
            title: Container(
                decoration: BoxDecoration(color: Colors.blue[200]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [icons[index], Text(names[index])],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => widgets[index],
                  ));
            });
      }),
    );
  }
}
