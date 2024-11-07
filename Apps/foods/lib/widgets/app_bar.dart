import 'package:flutter/material.dart';

AppBar apb(String st1, Color c1, BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [c1, Theme.of(context).colorScheme.primary],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    ),
    title: Text(st1),
    backgroundColor: c1,
    centerTitle: true,
  );
}
