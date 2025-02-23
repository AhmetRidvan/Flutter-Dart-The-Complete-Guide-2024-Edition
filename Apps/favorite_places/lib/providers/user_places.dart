import 'dart:io';

import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/models/place_model.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
      path.join(
        dbPath,
        'places.db',
      ), onCreate: (db, version) {
    db.execute(
      'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, adress TEXT)',
    );
  }, version: 1);
  return db;
}

class UserPlacesNotifier extends StateNotifier<List<Placemodel>> {
  UserPlacesNotifier() : super([]);

  Future<void> loadDatabase() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places = data.map(
      (value) {
        return Placemodel(
          id: value['id'] as String,
          title: value['title'] as String,
          file: File((value['image'] as String)),
          location: PlaceLocation(
              latitude: value['lat'] as double,
              longitude: value['lng'] as double,
              adress: value['adress'] as String),
        );
      },
    ).toList();

    state = places;
   
  }

  void addPlace(String title, File f1, PlaceLocation pl) async {
    final folderName = await syspath
        .getApplicationDocumentsDirectory(); // uygulamanın belgeleri yolu
    final fileName = path.basename(f1.path); //dosyanın adını alıyor
    File eFile =
        await f1.copy('${folderName.path}/$fileName'); //buda kaydediyor

    final newPlace = Placemodel(title: title, file: eFile, location: pl);

    final db = await _getDatabase();

    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.file.path,
      'lat': newPlace.location.latitude,
      'lng': newPlace.location.longitude,
      'adress': newPlace.location.adress,
    });
    state = [...state, newPlace];
  }
}

final UserPlacesNotifierProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Placemodel>>(
  (ref) {
    return UserPlacesNotifier();
  },
);
