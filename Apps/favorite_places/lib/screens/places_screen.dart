import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _placeListScreen();
  }
}

class _placeListScreen extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlacesList(places: [
        Placemodel(title: "asd"),
        Placemodel(title: "asd"),
        Placemodel(title: "asd")
      ]),
      appBar: AppBar(
        title: Text(
          "Your places",
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.surface,
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) {
                  return AddPlaceScreen();
                },
              ));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
