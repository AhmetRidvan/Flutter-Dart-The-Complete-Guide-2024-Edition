import 'package:favorite_places/models/place_model.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? "Pick your location" : "Your Location"),
      ),
    );
  }
}
