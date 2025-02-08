import 'package:favorite_places/screens/places_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp()); //2:29
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: PlacesScreen());
  }
}

final theme = ThemeData().copyWith(
  brightness: Brightness.dark,
  colorScheme: color,
  appBarTheme: AppBarTheme(backgroundColor: color.onSurface),
  scaffoldBackgroundColor: color.surface,
  textTheme: GoogleFonts.pixelifySansTextTheme().copyWith(
    titleSmall: GoogleFonts.pixelifySans(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.pixelifySans(
      fontWeight: FontWeight.bold,
      color: color.onSurface
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
