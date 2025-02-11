import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imageInput extends StatefulWidget {
  const imageInput({super.key});

  @override
  State<imageInput> createState() {
    return _imageInputState();
  }
}

class _imageInputState extends State<imageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(
        pickedImage.path,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: Icon(Icons.camera_alt),
      label: Text("Take picture"),
      onPressed: _takePicture,
    );
    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file (
          _selectedImage!,
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
      );
    }

    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 5, color: Theme.of(context).colorScheme.onSurface)),
        alignment: Alignment.center,
        height: 400,
        width: 400,
        child: content);
  }
}
