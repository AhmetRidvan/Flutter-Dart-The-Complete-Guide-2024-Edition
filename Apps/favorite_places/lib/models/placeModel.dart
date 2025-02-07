import 'package:uuid/uuid.dart';

final u1 = Uuid();

class Placemodel {
  Placemodel({required this.title}) : id = u1.v4(); //otomatik atama

  String id;
  String title;
}
