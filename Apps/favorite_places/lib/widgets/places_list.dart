import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  PlacesList({super.key, required this.places});

  List<Placemodel> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          "No places added",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return PlaceDetailScreen(p1: places[index]);
                },
              ));
            },
            subtitle: Text(
              places[index].location.adress,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: FileImage(places[index].file),
            ),
          ),
        );
      },
    );
  }
}
