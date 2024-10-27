import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/Widgets/appbar.dart';
import 'package:meals/Widgets/myDrawer.dart';
import 'package:meals/screens/tabs.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterScreen();
  }
}

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class _FilterScreen extends State<StatefulWidget> {
  bool _gluten = false;
  bool _lactose = false;
  bool _vegetarian = false;
  bool _vegan = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Mydrawer(
      //   merhaba: (selam) {
      //     Navigator.of(context).pop();
      //     if (selam == "m") {
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //         builder: (context) => TabScreen(),
      //       ));
      //     }
      //   },
      // ),
      appBar: appBar("Your filters !", context),
      body: PopScope(
        canPop:
            false, // trude otomatik Navigator.pop devreye girer ve sadece didpop kodu çalışır false da bütün kod
        //çalışır ama otomatik Navigator.pop gider.
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            print(didPop);
            return;
          }
          print("asd");
          Navigator.of(context).pop({     
            Filter.glutenFree: _gluten,
            Filter.lactoseFree: _lactose,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
                activeColor: Theme.of(context).colorScheme.tertiary,
                subtitle: Text(
                  "Only include gluten-free meals !",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                title: Text(
                  "Gluten-free",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                value: _gluten,
                contentPadding: EdgeInsets.only(left: 30, right: 30),
                onChanged: (value) {
                  setState(() {
                    _gluten = value;
                  });
                }),
            SwitchListTile(
                activeColor: Theme.of(context).colorScheme.tertiary,
                subtitle: Text(
                  "Only include lactose-free meals !",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                title: Text(
                  "Lactose-free",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                value: _lactose,
                contentPadding: EdgeInsets.only(left: 30, right: 30),
                onChanged: (value) {
                  setState(() {
                    _lactose = value;
                  });
                }),
            SwitchListTile(
                activeColor: Theme.of(context).colorScheme.tertiary,
                subtitle: Text(
                  "Only include vegetarian-free meals !",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                title: Text(
                  "vegetarian-free",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                value: _vegetarian,
                contentPadding: EdgeInsets.only(left: 30, right: 30),
                onChanged: (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
            SwitchListTile(
                activeColor: Theme.of(context).colorScheme.tertiary,
                subtitle: Text(
                  "Only include vegan-free meals !",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                title: Text(
                  "vegan-free",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                value: _vegan,
                contentPadding: EdgeInsets.only(left: 30, right: 30),
                onChanged: (value) {
                  setState(() {
                    _vegan = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
