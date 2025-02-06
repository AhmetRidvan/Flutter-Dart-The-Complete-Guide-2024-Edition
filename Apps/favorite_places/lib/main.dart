import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp(); //0:42
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home: );
  }
}

final theme = ThemeData().copyWith(
  brightness: Brightness.dark,
  colorScheme: color,
  scaffoldBackgroundColor: color.surface,
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
