import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:favorite_places/models/place_model.dart'; //Düçi

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location =
        const PlaceLocation(latitude: 37.422, longitude: -122.084, adress: ""),
    required this.ShouldItChoose,
  });
  final PlaceLocation location;
  final bool ShouldItChoose;
  @override
  State<StatefulWidget> createState() {
    return _mapScreenState();
  }
}

class _mapScreenState extends State<MapScreen> {
  LatLng? _picketLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.ShouldItChoose ? "Pick your location" : "Your Location",
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        actions: [
          if (widget.ShouldItChoose)
            IconButton(
              color: Theme.of(context).colorScheme.surface,
              onPressed: () {
                Navigator.of(context).pop(_picketLocation);
              },
              icon: Icon(Icons.save),
            )
        ],
      ),
      body: GoogleMap(
          onTap: (argument) {
            setState(() {
              if (widget.ShouldItChoose == true) {
                _picketLocation = argument;
              } else {
                return;
              }
            });
          },
          markers: (_picketLocation == null && widget.ShouldItChoose)
              ? {}
              : {
                  Marker(
                      markerId: MarkerId("S1"),
                      position: _picketLocation ??
                          LatLng(widget.location.latitude,
                              widget.location.longitude)),
                },
          initialCameraPosition: CameraPosition(
              zoom: 16,
              target:
                  LatLng(widget.location.latitude, widget.location.longitude))),
    );
  }
}
