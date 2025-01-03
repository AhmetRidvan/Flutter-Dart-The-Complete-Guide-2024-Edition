

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  gluterFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{
   FiltersNotifier() : super({
    Filter.gluterFree : false,
    Filter.lactoseFree : false,
    Filter.vegetarian : false,
    Filter.vegan : false



   }); //State'e ilk durmunu veriyoruz

  void setFilter(Filter filter,bool isActive){
    state = {
      ...state,
      filter : isActive
    };
  }


}

var filtersProvider = StateNotifierProvider((ref) => ,);



/*
void main() {
  Map<int,String> ogrenciler = {
    1:"Mehmet özerk",
    2:"Şaban aktaş",
    3:"Ahmet şahin",
  } ;
  var ornek = {
    ...ogrenciler,
    3:"Yeni Ahmet şahin",
  };
  print(ornek);
}
{1: Mehmet özerk, 2: Şaban aktaş, 3: Yeni Ahmet şahin}

*/