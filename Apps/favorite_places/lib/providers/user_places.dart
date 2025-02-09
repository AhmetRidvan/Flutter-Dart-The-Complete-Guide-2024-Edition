import 'package:favorite_places/models/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Placemodel>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String _title) {
    final x = Placemodel(title: _title);
    state = [...state, x];
  }
}

final UserPlacesNotifierProvider = StateNotifierProvider<UserPlacesNotifier,List<Placemodel>>(
  (ref) {
    return UserPlacesNotifier();
  },
);
