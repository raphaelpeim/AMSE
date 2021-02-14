import 'package:flutter/material.dart';
import 'mediaList.dart';

class SportWidget extends StatelessWidget {
  final List<String> sportsTitles = <String>[
    'Athlétisme',
    'Patinage Artistique',
    'Gymnastique Artistique',
    'Snowboard',
  ];
  final List<String> sportsImages = <String>[
    'images/sports/athletism.jpeg',
    'images/sports/figureSkating.jpeg',
    'images/sports/gymnastic.jpeg',
    'images/sports/snowboard.jpeg',
  ];
  final List<String> sportsDescriptions = <String>[
    'L’athlétisme est un ensemble d’épreuves sportives codifiées comprenant les courses, sauts, lancers, épreuves combinées et marche. L\'origine du mot athlétisme vient du grec « Athlos » signifiant combat. Il s\’agit de l\’art de dépasser la performance des adversaires en vitesse ou en endurance, en distance ou en hauteur.',
    'Le patinage artistique est un sport ainsi qu\'une démonstration d\'art exécuté sur la glace qui améliore les qualités physiques et développe la sensibilité artistique avec des patins à lames. Ce sport est particulièrement populaire en Amérique du Nord, en Europe et en Asie. La Russie a beaucoup de patineuses.',
    'La gymnastique artistique est une discipline athlétique consistant à enchaîner des mouvements acrobatiques sur des agrès. On distingue la gymnastique artistique masculine et la gymnastique artistique féminine.',
    'Le snowboard, surf des neiges, planche à neige au Canada ou plus rarement planche de neige, est un sport de glisse sur neige. L\'équipement se compose d\'une planche de snowboard (board en anglais signifie « planche » et snow signifie « neige »), d\'une paire de fixations (il en existe plusieurs types) et d\'une paire de bottes adaptées (désignées par l\'anglicisme boots).',
  ];

  @override
  Widget build(BuildContext context) {
    return MediaList(
        title: 'Sports',
        titles: sportsTitles,
        images: sportsImages,
        descriptions: sportsDescriptions);
  }
}
