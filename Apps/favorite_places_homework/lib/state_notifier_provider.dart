import 'package:favorite_places/data/List_data.dart';
import 'package:favorite_places/models/place_model.dart';
import 'package:riverpod/riverpod.dart';

class ListNotifier extends StateNotifier<List<Place>> {
  ListNotifier() : super([]);

  void addItem(Place p1) {
    state = [
      ...state,
      p1,
    ];
  }

  
}

final ListProvider = StateNotifierProvider<ListNotifier, List<Place>>(
  (ref) {
    return ListNotifier();
  },
);
