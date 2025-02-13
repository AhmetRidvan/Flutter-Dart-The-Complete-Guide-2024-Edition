import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() {
    return _locationInput();
  }
}

class _locationInput extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Row(
          children: [ // 5:58
            TextButton.icon(
              label: Text("Get Current Location"),
              icon: Icon(Icons.location_on),
              onPressed: () {},
            ),
            TextButton.icon(
              onPressed: () {},icon: Icon(Icons.map),
              label: Text("Select on Map"),
            )
          ],
        )
      ],
    );
  }
}
