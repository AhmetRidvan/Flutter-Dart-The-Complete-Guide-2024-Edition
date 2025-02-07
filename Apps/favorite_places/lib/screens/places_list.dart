import 'package:flutter/material.dart';

class PlacesListScreen extends StatefulWidget {
  const PlacesListScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _placeListScreen();
  }
}

class _placeListScreen extends State<PlacesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your places"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
