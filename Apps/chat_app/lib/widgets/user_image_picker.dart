import 'package:flutter/material.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() {
    return _userImagePicker();
  }
}

class _userImagePicker extends State<UserImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 40,backgroundColor: Colors.grey,foregroundColor: ,),
        TextButton.icon(
          icon: Icon(Icons.image),
          onPressed: () {
            
          },
          label: Text(
            "Add Image",
            style: TextStyle(color: Theme.of(context).colorScheme.primary,),
          ),
        ),
      ],
    );
  }
}
