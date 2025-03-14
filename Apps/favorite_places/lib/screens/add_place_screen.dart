import 'dart:io';
import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import sıralaması dart, package, page

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _addPlaceScren();
  }
}

class _addPlaceScren extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? incomingImage;
  PlaceLocation? _selectedLocation;

  void addPlace() {
    final enteredText = _titleController.text;
    if (enteredText.isEmpty || incomingImage == null || _selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("No imput"),
        backgroundColor: Colors.red,
      ));
      return;
    }
    ref.read(UserPlacesNotifierProvider.notifier).addPlace(
          enteredText,
          incomingImage!,
          _selectedLocation!,
        );
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  GlobalKey k1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add new place",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.surface),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                  color: Theme.of(context).textTheme.titleMedium!.color),
              controller: _titleController,
              decoration: InputDecoration(
                  labelText: "Title",
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
            ),
            SizedBox(
              height: 20,
            ),
            imageInput(
              transferredImage: (file) {
                incomingImage = file;
              },
            ),
            SizedBox(
              height: 20,
            ),
            LocationInput(
              sad: (placeLocation) {
                _selectedLocation = placeLocation;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                addPlace();
              },
              label: Text("Add place"),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
