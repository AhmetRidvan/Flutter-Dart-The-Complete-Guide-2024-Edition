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
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 170,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 5, color: Theme.of(context).colorScheme.onSurface)),
          child: Text(
            "No location chosen",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              label: Text(
                "Get Current Location",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(),
              ),
              icon: Icon(Icons.location_on),
              onPressed: () {},
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
