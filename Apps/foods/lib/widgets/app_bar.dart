import 'package:flutter/material.dart';

AppBar apb(String st1, Color c1, BuildContext context,
    {bool? is_it_a_favorite}) {
  if (is_it_a_favorite != null) {
    return AppBar(
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.stacked_bar_chart))
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [c1, Theme.of(context).colorScheme.primary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
      title: Text(
        st1,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontSize: 17, color: Theme.of(context).colorScheme.onPrimary),
      ),
      backgroundColor: c1,
      centerTitle: true,
    );
  }
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [c1, Theme.of(context).colorScheme.primary],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    ),
    title: Text(
      st1,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
          fontSize: 17, color: Theme.of(context).colorScheme.onPrimary),
    ),
    backgroundColor: c1,
    centerTitle: true,
  );
}
