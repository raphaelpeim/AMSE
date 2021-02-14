import 'package:flutter/material.dart';
import 'details.dart';

class MediaList extends StatelessWidget {
  MediaList({Key key, this.title, this.titles, this.images, this.descriptions})
      : super(key: key);

  final title;
  final titles;
  final images;
  final descriptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text(title),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(titles.length, (index) {
            return ListTile(
              title: Image(
                image: AssetImage(images[index]),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                        title: titles[index],
                        image: Image(image: AssetImage(images[index])),
                        description: descriptions[index]),
                  ),
                );
              },
            );
          }),
        ));
  }
}
