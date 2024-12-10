import 'dart:ffi';

import 'package:flutter/material.dart';

class SwitchListTileWidget extends StatefulWidget {
  SwitchListTileWidget(
      {super.key,
      required,
      required this.b1,
      required this.t1,
      required this.callBack});

  bool b1;
  String t1;
  ValueChanged<bool> callBack;

  @override
  State<StatefulWidget> createState() {
    return _SwitchListTileWidget();
  }
}

class _SwitchListTileWidget extends State<SwitchListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.only(left: 30, right: 30),
      activeColor: Colors.red,
      value: widget.b1,
      onChanged: (value) {
        setState(() {
          widget.b1 = value;
          widget.callBack(value);
        });
      },
      title: Text(
        widget.t1,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
