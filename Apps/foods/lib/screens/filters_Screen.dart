import 'package:flutter/material.dart';
import 'package:foods/screens/bottom_navigation_bar_screen.dart';
import 'package:foods/widgets/app_bar.dart';
import 'package:foods/widgets/dra_wer.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends State<StatefulWidget> {
  bool b1 = false;
  void _filterScreenDrawerFunction(String asd) {
    Navigator.pop(context);
    if (asd == "Foods") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return BottomNavigationBarScreen();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apb("Filters", Theme.of(context).colorScheme.onSurface, context),
      drawer: Dra_wer(
        textFunction: (text) {
          return _filterScreenDrawerFunction(text);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwitchListTile(
            contentPadding: EdgeInsets.only(left: 30, right: 30),
            activeColor: Theme.of(context).colorScheme.tertiary,
            value: b1,
            onChanged: (value) {
              setState(() {
                b1 = value;
              });
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only include gluten-free foods",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          )
        ],
      ),
    );
  }
}
