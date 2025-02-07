import 'package:favorite_places/list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp(); 
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: ListPage());
  }
}

final theme = ThemeData().copyWith(
  brightness: Brightness.dark,
  colorScheme: color,
  scaffoldBackgroundColor: color.onSurface,
  textTheme: GoogleFonts.pixelifySansTextTheme().copyWith(
    titleSmall: GoogleFonts.pixelifySans(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.pixelifySans(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.pixelifySans(
      fontWeight: FontWeight.bold,
    ),
  ),
);

final color = ColorScheme.fromSeed(
  seedColor: Colors.lightBlue,
  brightness: Brightness.dark,
);
