import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() {
    return _locationInput();
  }
}

class _locationInput extends State<LocationInput> {
  bool _isGettingLocation = false;

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
    String _key = "AIzaSyCNsqbFhqmjze6fJI_aMVeQNGeIccy9Esk";

    final _url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$_key');
    final _response = await http.get(_url);
    final _converted = jsonDecode(_response.body);
    final _data = _converted["results"][0]["formatted_address"];
    

    setState(() {
      _isGettingLocation = false;
    });

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
