import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:location/location.dart';
import 'package:favorite_places/models/place_model.dart';

class LocationInput extends StatefulWidget {
  LocationInput({super.key, required this.sad});
  void Function(PlaceLocation placeLocation) sad;

  @override
  State<LocationInput> createState() {
    return _locationInput();
  }
}

class _locationInput extends State<LocationInput> {
  String key = "AIzaSyCNsqbFhqmjze6fJI_aMVeQNGeIccy9Esk";
  bool _isGettingLocation = false;
  PlaceLocation? picketLocation;

  String get locationImageUrl {
    if (picketLocation == null) {
      return '';
    }
    final lat = picketLocation!.latitude;
    final long = picketLocation!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$long&zoom=15&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$lat,$long&key=$key';
  }

  void getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final long = locationData.longitude;

    if (lat == null || long == null) {
      return;
    }

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$key');
    final response = await http.get(url);
    final converted = jsonDecode(response.body);
    final adress = converted["results"][0]["formatted_address"];

    setState(() {
      picketLocation =
          PlaceLocation(latitude: lat, longitude: long, adress: adress);
      _isGettingLocation = false;
    });

    widget.sad(picketLocation!);

    print(locationData.latitude);
    print(locationData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      "No location chosen",
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.center,
    );
    if (picketLocation != null) {
      content = Image.network(
        width: double.infinity,
        height: double.infinity,
        locationImageUrl,
        fit: BoxFit.cover,
      );
    }
    if (_isGettingLocation) {
      content = CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 170,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 5, color: Theme.of(context).colorScheme.onSurface)),
            child: content),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              label: Text(
                "Get Current Location",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(),
              ),
              icon: Icon(Icons.location_on),
              onPressed: getCurrentLocation,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text(
                "Select on Map",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
          ],
        )
      ],
    );
  }
}
