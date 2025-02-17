import 'dart:io';

import 'package:favorite_places/models/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Placemodel>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String title,File f1,PlaceLocation pl) {
    final x = Placemodel(title: title,file: f1,location: pl);
    state = [...state, x];
  }
}

final UserPlacesNotifierProvider = StateNotifierProvider<UserPlacesNotifier,List<Placemodel>>(
  (ref) {
    return UserPlacesNotifier();
  },
);
