import 'package:flutter/material.dart';
import 'list.dart';

class SerieWidget extends StatefulWidget {
  SerieWidget({Key key}) : super(key: key);

  @override
  _SerieWidgetState createState() => _SerieWidgetState();
}

class _SerieWidgetState extends State<SerieWidget> {
  List<String> seriesTitles = <String>[
    'Breaking Bad',
    'Friends',
    'Game Of Thrones',
    'How I Met Your Mother',
    'Peaky Blinders',
    'The Queen\'s Gambit',
    'Rick And Morty',
    'South Park',
  ];
  List<String> seriesImages = <String>[
    'images/series/breakingBad.jpg',
    'images/series/friends.jpg',
    'images/series/gameOfThrones.jpg',
    'images/series/himym.jpg',
    'images/series/peakyBlinders.jpg',
    'images/series/queensGambit.jpg',
    'images/series/rickAndMorty.jpg',
    'images/series/southPark.jpg',
  ];
  List<String> seriesDescriptions = <String>[
    'Breaking Bad, ou Breaking Bad : Le Chimiste au Québec, est une série télévisée américaine en 62 épisodes de 47 minutes, créée par Vince Gilligan, diffusée simultanément du 20 janvier 2008 au 29 septembre 2013 sur AMC aux États-Unis et au Canada, et ensuite sur Netflix.',
    'Friends [fɹɛn(d)z] est une sitcom américaine en 10 saisons2, avec 236 épisodes de 22 minutes, créée par Marta Kauffman et David Crane, et diffusée entre le 22 septembre 1994 et le 6 mai 2004 sur le réseau NBC.',
    'Game of Thrones [geɪm əv θɹoʊnz], également appelée Le Trône de fer (selon le titre français de l\'œuvre romanesque dont elle est adaptée) est une série télévisée américaine de Fantasy créée par David Benioff et D. B. Weiss, diffusée entre le 17 avril 2011 et le 19 mai 2019 sur HBO aux États-Unis en simultané sur HBO Canada au Canada.',
    'How I Met Your Mother (littéralement « Comment j’ai rencontré votre mère ») ou Comment je l\'ai rencontrée au Québec est une série télévisée américaine en 208 épisodes de 22 minutes créée par Carter Bays et Craig Thomas et diffusée entre le 19 septembre 2005 et le 31 mars 2014 sur la chaîne CBS, et en simultané sur CH/E! (saisons 1 à 4) puis Citytv (saisons 5 à 9) au Canada.',
    'Peaky Blinders est une série télévisée britannique créée par Steven Knight et diffusée initialement le 12 septembre 2013 sur BBC Two, puis sur BBC One depuis le 25 août 2019, pour la cinquième saison.',
    'Le Jeu de la dame (The Queen\'s Gambit) est une mini-série américaine en sept parties d\'environ 56 minutes chacune, créée par Scott Frank et Allan Scott, adaptée du roman éponyme de Walter Tevis publié en 1983, et mise en ligne le 23 octobre 2020 sur Netflix.',
    'Rick et Morty (Rick and Morty) est une série d\'animation pour adultes américaine créée par Justin Roiland et Dan Harmon, diffusée depuis le 2 décembre 2013 sur Cartoon Network, dans la tranche fin de soirée Adult Swim. La série suit les mésaventures de Rick Sanchez, un scientifique cynique et fantasque, et de son petit-fils, Morty Smith, perturbé et facilement influençable, qui partagent leur temps entre une vie domestique et des aventures interdimensionnelles.',
    'South Park (prononcé : [saʊθ pɑːk]) est une série d\'animation pour adultes américaine, créée et écrite par Trey Parker et Matt Stone, diffusée depuis le 13 août 1997 sur Comedy Central.',
  ];

  @override
  Widget build(BuildContext context) {
    return MediaList(
        titles: seriesTitles,
        images: seriesImages,
        descriptions: seriesDescriptions);
  }
}
