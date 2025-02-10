import 'package:flutter/material.dart';

class imageInput extends StatefulWidget {
  const imageInput({super.key});

  @override
  State<imageInput> createState() {
    return _imageInputState();
  }
}
void _takePicture(){

}


class _imageInputState extends State<imageInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 5, color: Theme.of(context).colorScheme.onSurface)),
      alignment: Alignment.center,
      height: 250,
      width: double.infinity,
      child: TextButton.icon(
        icon: Icon(Icons.camera_alt),
        label: Text("Take picture"),
        onPressed: _takePicture,
      ),
    );
  }
}
