import 'package:favorite_places/models/place_model.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  PlaceDetailScreen({super.key, required this.p1});
  Placemodel p1;

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
              child: Column(
                children: [
                  Text("asdasd"),
                ],
              ),
            )
          ],
        ));
  }
}
