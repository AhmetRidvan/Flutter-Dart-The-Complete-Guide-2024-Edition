import 'dart:io';

import 'package:uuid/uuid.dart';

final u1 = Uuid();

class PlaceLocation {
  PlaceLocation(
      {required this.latitude, required this.longitude, required this.adress});
  double latitude;
  double longitude;
  String adress;
}

class Placemodel {
  Placemodel({
    required this.title,
    required this.file,
    required this.location,
  }) : id = u1.v4(); //otomatik atama

  String id;
  String title;
  File file;
  PlaceLocation location;
}
