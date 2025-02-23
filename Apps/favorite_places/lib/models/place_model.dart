import 'dart:io';

import 'package:uuid/uuid.dart';

final u1 = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.adress,
  });
  final double latitude;
  final double longitude;
  final String adress;
}

class Placemodel {
  Placemodel({
    required this.title,
    required this.file,
    required this.location,
    String? id, //hem opsiyonel hemde otomatik bir arada olunca böyle yazılıyor.
  }) : id = id ?? u1.v4(); //otomatik atama

  String id;
  String title;
  File file;
  PlaceLocation location;
}
