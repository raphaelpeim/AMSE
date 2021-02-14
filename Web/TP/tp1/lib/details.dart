import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({Key key, this.title, this.image, this.description})
      : super(key: key);

  final String title;
  final Image image;
  final String description;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text(title),
        ),
        body: Container(
          padding: EdgeInsets.all(5.0),
          child: Table(
              border: TableBorder(
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black)),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(color: Colors.blue[700]),
                      child: Text('Affiche',
                          style: TextStyle(color: Colors.white, fontSize: 35))),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(color: Colors.blue[700]),
                      child: Text('Description',
                          style: TextStyle(color: Colors.white, fontSize: 35)))
                ]),
                TableRow(children: [
                  Container(padding: EdgeInsets.all(10.0), child: image),
                  Container(
                      padding: EdgeInsets.all(10.0), child: Text(description)),
                ]),
              ]),
        ));
  }
}
