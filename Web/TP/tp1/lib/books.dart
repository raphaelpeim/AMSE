import 'package:flutter/material.dart';
import 'mediaList.dart';

class BookWidget extends StatelessWidget {
  final List<String> booksTitles = <String>[
    '1984',
    'Le meilleur des mondes',
    'Cyrano de Bergerac',
    'Game Of Thrones',
    'Harry Potter',
    'Les misérables',
    'La liste de Schindler',
    'Vingt mille lieues sous les mers',
  ];
  final List<String> booksImages = <String>[
    'images/livres/1984.jpg',
    'images/livres/braveNewWorld.jpg',
    'images/livres/cyrano.jpg',
    'images/livres/gameOfThrones.jpg',
    'images/livres/harryPotter.jpg',
    'images/livres/miserables.jpg',
    'images/livres/schindlersList.jpg',
    'images/livres/vmlslm.jpg',
  ];
  final List<String> booksDescriptions = <String>[
    '1984 (Nineteen Eighty-Four) est le plus célèbre roman de George Orwell, publié en 1949. Il décrit une Grande-Bretagne trente ans après une guerre nucléaire entre l\'Est et l\'Ouest censée avoir eu lieu dans les années 1950 et où s\'est instauré un régime de type totalitaire fortement inspiré à la fois du stalinisme et de certains éléments du nazisme.',
    'Le Meilleur des mondes (Brave New World) est un roman d\'anticipation dystopique, écrit en 1931 par Aldous Huxley. Il paraît en 1932. Huxley le rédige en quatre mois, à Sanary-sur-Mer, dans le sud de la France. Vingt-cinq ans plus tard, Huxley publie un essai consacré à ce livre, Retour au meilleur des mondes, insistant notamment sur les évolutions du monde qu\'il perçoit comme allant dangereusement vers le monde décrit dans son ouvrage',
    'Cyrano de Bergerac est l\'une des pièces les plus populaires du théâtre français, et la plus célèbre de son auteur, Edmond Rostand. Librement inspirée de la vie et de l\'œuvre de l\'écrivain libertin Savinien de Cyrano de Bergerac (1619-1655), elle est représentée pour la première fois le 28 décembre 1897, au Théâtre de la Porte-Saint-Martin, à Paris.',
    'Nous sommes en 297 après la Conquête. Dans le royaume des Sept Couronnes, Jon Arryn, la Main du Roi, est mort. Pour le remplacer, le roi Robert Baratheon fait appel à son ami d\'enfance, Lord Eddard Stark, gouverneur du Nord, qui l\'avait aidé à conquérir le trône quinze ans auparavant lors d\'une rébellion contre l\'ancien souverain, Aerys II Targaryen.',
    'Harry Potter à l\'école des sorciers (Harry Potter and the Philosopher\'s Stone) est le premier roman de la série littéraire centrée sur le personnage de Harry Potter, créé par J. K. Rowling. Sorti le 26 juin 1997, il est initialement tiré à 500 exemplaires. En France, le roman a été publié le 9 octobre 1998.',
    'Le roman Les Misérables de Victor Hugo a paru en 1862. Il a donné lieu à de nombreuses adaptations, au cinéma et sur de nombreux autres supports.',
    'La Liste de Schindler (titre original : Schindler\'s Ark) est un roman historique écrit par l\'Australien Thomas Keneally et publié en 1982. Il relate l\'action d\'Oskar Schindler (décédé huit ans auparavant), un industriel allemand et membre du Parti nazi, qui a sauvé pendant la Seconde Guerre mondiale près de 1 200 Juifs promis à la mort dans le camp de concentration de Płaszów (Pologne)',
    'Vingt Mille Lieues sous les mers est un roman d\'aventures de Jules Verne, paru en 1869-1870. Il relate le voyage de trois naufragés capturés par le capitaine Nemo, mystérieux inventeur qui parcourt les fonds des mers à bord du Nautilus, un sous-marin très en avance sur les technologies de l\'époque.',
  ];

  @override
  Widget build(BuildContext context) {
    return MediaList(
        title: 'Livres',
        titles: booksTitles,
        images: booksImages,
        descriptions: booksDescriptions);
  }
}
