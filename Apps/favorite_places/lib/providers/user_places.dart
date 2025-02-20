import 'dart:io';

import 'package:favorite_places/models/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspath;

class UserPlacesNotifier extends StateNotifier<List<Placemodel>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String title, File f1, PlaceLocation pl)async {
    final appDir = await syspath.getApplicationDocumentsDirectory();

    final x = Placemodel(title: title, file: f1, location: pl);
    state = [...state, x];
  }
}

final UserPlacesNotifierProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Placemodel>>(
  (ref) {
    return UserPlacesNotifier();
  },
);
