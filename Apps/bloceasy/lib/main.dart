import 'package:bloceasy/U%C4%B0/Counter_Page.dart';
import 'package:bloceasy/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
      home: MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) {
        return CounterBloc();
      },
    )
  ], child: BlockApp())));
}

class BlockApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BlockApp();
  }
}

class _BlockApp extends State<BlockApp> {
  @override
  Widget build(BuildContext context) {
    return CounterPage();
  }
}
