import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() {
    return _userImagePicker();
  }
}

class _userImagePicker extends State<UserImagePicker> {
  File? _picketImage;

  void _pickImage() async {
    final p = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (p == null) {
      return;
    }

    setState(() {
      _picketImage = File(p.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundImage:
              _picketImage == null ? null : FileImage(_picketImage!),
        ),
        TextButton.icon(
          icon: Icon(Icons.image),
          onPressed: _pickImage,
          label: Text(
            "Add Image",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
