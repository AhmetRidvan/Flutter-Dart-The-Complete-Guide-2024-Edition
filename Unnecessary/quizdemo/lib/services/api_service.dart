import 'dart:convert';

import 'package:http/http.dart' as http;

const link =
    "https://opentdb.com/api.php?amount=15&category=18&difficulty=medium";

getQuizData() async {
  var uri = await http.get(Uri.parse(link));
  if (uri == 200) {
    var data = jsonDecode(uri.body);
    return data;
  }
}
