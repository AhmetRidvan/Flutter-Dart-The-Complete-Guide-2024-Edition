import 'package:state_notifier/state_notifier.dart';
// bu sadece örnek anla iyice
class FavoriteFoodProvider extends StateNotifier<List<String>> {
  FavoriteFoodProvider() : super([]);

  void addFavorite(String food) {
    state = [...state, food];
  }

  void removeFavorite(String food) {
    state = state.where((item) => item != food).toList();
  }

  bool isFavorite(String food) {
    return state.contains(food);
  }
}
