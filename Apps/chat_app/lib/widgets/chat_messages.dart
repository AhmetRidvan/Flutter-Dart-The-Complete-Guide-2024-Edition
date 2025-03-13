import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy(field).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No messages!"));
        } else if (snapshot.hasError) {
          return Center(child: Text("Something went wrong!"));
        } else {
          final loadedMessages = snapshot.data!.docs;
          return ListView.builder(
            itemCount: loadedMessages.length,
            itemBuilder: (context, index) {
              return Text(loadedMessages[index]['text']);
            },
          );
        }
      },
    );
  }
}
