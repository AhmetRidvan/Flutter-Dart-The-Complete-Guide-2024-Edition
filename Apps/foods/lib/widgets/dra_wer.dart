import 'package:flutter/material.dart';

class Dra_wer extends StatelessWidget {
  Dra_wer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.error
            ])),
            child: Text("s"),
            padding: EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }
}
