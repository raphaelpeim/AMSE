import 'package:flutter/material.dart';
import 'list.dart';

class FilmWidget extends StatefulWidget {
  FilmWidget({Key key}) : super(key: key);

  @override
  _FilmWidgetState createState() => _FilmWidgetState();
}

class _FilmWidgetState extends State<FilmWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(child: MyList());
  }
}
