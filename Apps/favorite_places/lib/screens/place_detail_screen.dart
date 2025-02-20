import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; //duçi

import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/screens/map_screen.dart';


class PlaceDetailScreen extends StatelessWidget {
  PlaceDetailScreen({super.key, required this.p1});
  Placemodel p1;

  String get locationImageUrl {
    String _key = "AIzaSyCNsqbFhqmjze6fJI_aMVeQNGeIccy9Esk";
    final lat = p1.location.latitude;
    final long = p1.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$long&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$lat,$long&key=$_key';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            p1.title,
            style: TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
        ),
        body: Stack(
          children: [
            Image.file(
              p1.file,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push<LatLng>(MaterialPageRoute(
                        builder: (context) {
                          return MapScreen(
                            location: p1.location,
                            ShouldItChoose: false,
                          );
                        },
                      ));
                    },
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(locationImageUrl),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.transparent,
                          Colors.black54,
                        ])),
                    child: Text(
                      textAlign: TextAlign.center,
                      p1.location.adress,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
