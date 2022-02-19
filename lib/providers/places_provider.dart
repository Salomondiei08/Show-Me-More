import 'package:flutter/material.dart';

import '../models/place.dart';

class Places with ChangeNotifier {
  List<Place> placeList = [
    Place(
      id: DateTime.now().toString(),
      name: 'INP-SUD',
      description:
          'Partie Sud de l\'INP réverbée aux étudiants des classes préparatoires',
      contact: '+2250778169151',
      imageUrl: 'https://media-files.abidjan.net/photo/INPHB%20(59).JPG',
      websiteUrl: 'https://inphb.ci/2/vues/accueil/',
    ),
    Place(
      id: DateTime.now().toString(),
      name: 'INP-NORD',
      description:
          'Partie Nord de l\'INP réverbée aux étudiants des écoles d\'ingénieurs',
      contact: '+2250778169151',
      imageUrl:
          'http://www.atoo.ci/wp-content/uploads/2019/07/inp-hb-education-enseignement-sup%C3%A9rieur-e1564589242628.jpg',
      websiteUrl: 'https://inphb.ci/2/vues/accueil/',
    ),
    Place(
      id: DateTime.now().toString(),
      name: 'INP-NORD',
      description:
          'Partie Nord de l\'INP réverbée aux étudiants des écoles d\'ingénieurs',
      contact: '+2250778169151',
      imageUrl:
          'http://www.atoo.ci/wp-content/uploads/2019/07/inp-hb-education-enseignement-sup%C3%A9rieur-e1564589242628.jpg',
      websiteUrl: 'https://inphb.ci/2/vues/accueil/',
    ),
    Place(
      id: DateTime.now().toString(),
      name: 'INP-NORD',
      description:
          'Partie Nord de l\'INP réverbée aux étudiants des écoles d\'ingénieurs',
      contact: '+2250778169151',
      imageUrl:
          'http://www.atoo.ci/wp-content/uploads/2019/07/inp-hb-education-enseignement-sup%C3%A9rieur-e1564589242628.jpg',
      websiteUrl: 'https://inphb.ci/2/vues/accueil/',
    ),
  ];

  List<Place> getAll() => [...placeList];

  void addPlace(Place place) {
    placeList.add(place);
  }

  void deletePlace(Place place) {
    placeList.removeWhere((oldPlace) => oldPlace.id == place.id);
  }

  List<Place> findByName(String placeName) {
    return [
      ...placeList.where((oldPlace) =>
          oldPlace.name.toLowerCase().startsWith(placeName.toUpperCase()))
    ];
  }

  int getLenght() => placeList.length;

  bool isPlaceListEmpty() => placeList.isEmpty;
}
