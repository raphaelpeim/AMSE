import 'package:flutter/material.dart';
import 'list.dart';

class FilmWidget extends StatefulWidget {
  FilmWidget({Key key}) : super(key: key);

  @override
  _FilmWidgetState createState() => _FilmWidgetState();
}

class _FilmWidgetState extends State<FilmWidget> {
  List<String> filmsTitles = <String>[
    'Apollo 13',
    'Big Fish',
    'Billy Elliot',
    'Imitation Game',
    'October Sky',
    'Pride',
    'The Social Network',
    'The Theory Of Everything',
  ];
  List<String> filmsImages = <String>[
    'images/films/apollo13.jpg',
    'images/films/bigFish.jpg',
    'images/films/billyElliot.jpg',
    'images/films/imitationGame.jpg',
    'images/films/octoberSky.jpg',
    'images/films/pride.jpg',
    'images/films/socialNetwork.jpg',
    'images/films/theoryOfEverything.jpg',
  ];
  List<String> filmsDescriptions = <String>[
    'Apollo 13 est un film catastrophe américain réalisé par Ron Howard, sorti en 1995. Il s\'agit d\'une adaptation du livre Lost Moon: The Perilous Voyage of Apollo 13 (1994), écrit par James « Jim » Lovell, qui fut le commandant de la mission spatiale Apollo 13, et Jeffrey Kluger.',
    'Big Fish ou Big Fish : La Légende du gros poisson au Québec, est un film fantastique américain de Tim Burton, écrit par John August et sorti en 2003.',
    'Billy Elliot est une comédie dramatique britannique réalisée par Stephen Daldry sur un scénario de Lee Hall, mettant en scène Jamie Bell dans le rôle-titre, Julie Walters en Mme Wilkinson, le professeur de danse, Gary Lewis, le père mineur en grève, et Jamie Draven, le frère aîné de Billy Elliot.',
    'Imitation Game ou Le Jeu de l\'Imitation au Québec (The Imitation Game) est un film biographique américain réalisé par Morten Tyldum, sorti en 2014. Il s\'agit de l\'adaptation cinématographique de la biographie Alan Turing ou l\'énigme de l\'intelligence (Alan Turing: The Enigma) d\'Andrew Hodges.',
    'Ciel d\'octobre (October Sky1) est un film biographique américain de 1999, réalisé par Joe Johnston et tiré du roman d\'Homer Hickam, Rocket Boys.',
    'Pride ou Pride : Une rencontre improbable au Québec est un film britannique réalisé par Matthew Warchus, sorti en 2014. Présenté en séances spéciales de la Quinzaine des réalisateurs au Festival de Cannes 2014, il remporte la Queer Palm. Au festival international du film de Flandre-Gand, il remporte le prix du public « Port de Gand ». Au British Independent Film Awards 2014, il remporte le prix du meilleur film.',
    'The Social Network ou Le Réseau social au Québec1 est un film américain de David Fincher, sorti en 2010. Le film a remporté trois trophées lors de la 83e cérémonie des Oscars. Le film revient sur la création du réseau social Facebook par Mark Zuckerberg et ses relations avec ses camarades de l\'université Harvard.',
    'Une merveilleuse histoire du temps (The Theory of Everything en version originale ; La Théorie de l\'Univers au Québec) est un film biographique britannique réalisé par James Marsh, sorti en 2014. Il narre la vie du physicien et cosmologiste Stephen Hawking, en particulier sa jeunesse.',
  ];

  @override
  Widget build(BuildContext context) {
    return MediaList(
        titles: filmsTitles,
        images: filmsImages,
        descriptions: filmsDescriptions);
  }
}
