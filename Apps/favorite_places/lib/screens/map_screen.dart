import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:favorite_places/models/place_model.dart'; //Düçi

class MapScreen extends StatefulWidget {
  MapScreen({
    super.key,
    this.location =
        const PlaceLocation(latitude: 37.422, longitude: -122.084, adress: ""),
    this.isSelecting = true,
  });
  final PlaceLocation location;
  final bool isSelecting;
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
        title:
            Text(widget.isSelecting ? "Pick your location" : "Your Location"),
        actions: [
          if (widget.isSelecting)
            IconButton(
              color: Theme.of(context).colorScheme.surface,
              onPressed: () {},
              icon: Icon(Icons.save),
            )
        ],
      ),
      body: GoogleMap(
          onTap: (argument) {
            setState(() {
              _picketLocation = argument;
            });
          },
          markers: _picketLocation != null
              ? <Marker>{
                  Marker(
                      visible: true,
                      markerId: MarkerId("S1"),
                      position: _picketLocation ??
                          LatLng(widget.location.latitude,
                              widget.location.longitude)),
                }
              : <Marker>{},
          initialCameraPosition: CameraPosition(
              zoom: 16,
              target:
                  LatLng(widget.location.latitude, widget.location.longitude))),
    );
  }
}
