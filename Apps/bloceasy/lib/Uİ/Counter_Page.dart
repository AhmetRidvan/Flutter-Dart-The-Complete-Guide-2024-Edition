import 'dart:math';

import 'package:bloceasy/bloc/counter_bloc.dart';
import 'package:bloceasy/bloc/counter_event.dart';
import 'package:bloceasy/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  CounterPage() : super();

  @override
  Widget build(BuildContext context) {
    var counterBloc = context.read<CounterBloc>();

    return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                counterBloc.add(CounterIncrementPressed());
              },
            ),
            SizedBox(
              height: 40,
            ),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                counterBloc.add(CounterDecrementPressed());
              },
            ),
            SizedBox(
              height: 40,
            ),
            FloatingActionButton(
              child: Icon(Icons.exposure_zero),
              onPressed: () {
                counterBloc.add(CounterResetPressed());
              },
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Bloc"),
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              if (state.sayi == 0) {
                return Text("Değer 0");
              }
              return Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  for (int x = 0; x < state.sayi; x++)
                    Positioned(
                        left: Random().nextInt(100).toDouble(),
                        top: Random().nextInt(200).toDouble(),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset(
                            "images/pngwing.com.png",
                          ),
                        ))
                ],
              );
            },
          ),
        ));
  }
}
