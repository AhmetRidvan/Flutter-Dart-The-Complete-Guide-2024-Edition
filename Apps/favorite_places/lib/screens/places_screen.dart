import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/add_place_screen.dart';
import 'package:favorite_places/widgets/places_list.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() {
    return _placeScreen();
  }
}

class _placeScreen extends ConsumerState<PlacesScreen> {
  late final _placesFuture;
  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(UserPlacesNotifierProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch<List<Placemodel>>(UserPlacesNotifierProvider);
    return Scaffold(
      body: FutureBuilder(
        future: _placesFuture,
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : PlacesList(
                  places: userPlaces,
                );
        },
      ),
      appBar: AppBar(
        title: Text(
          "Your places",
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.surface,
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) {
                  return AddPlaceScreen();
                },
              ));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
