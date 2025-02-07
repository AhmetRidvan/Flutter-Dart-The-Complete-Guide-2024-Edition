import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/place_model.dart';

class ModelPage extends ConsumerStatefulWidget {
  ModelPage({super.key, required this.p1});
  Place p1;
  @override
  ConsumerState<ModelPage> createState() {
    return _modalPage();
  }
}

class _modalPage extends ConsumerState<ModelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.p1.title)
          ],
        ),
      ),
    );
  }
}
