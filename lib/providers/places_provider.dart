import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/place.dart';

class PlacesProvider with ChangeNotifier {
  final List<Place> _places = [];

  List<Place> get items {
    return [..._places];
  }

  void addPlace(String name, File image) {
    _places.add(Place(id: DateTime.now().toString(), name: name, image: image));
    notifyListeners();
  }
}
