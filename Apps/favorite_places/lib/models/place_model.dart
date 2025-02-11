import 'dart:io';

import 'package:uuid/uuid.dart';

final u1 = Uuid();

class Placemodel {
  Placemodel({required this.title,required this.file}) : id = u1.v4(); //otomatik atama

  String id;
  String title;
  File file;
}
