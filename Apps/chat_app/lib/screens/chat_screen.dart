import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/new_message.dart';
import 'package:chat_app/widgets/chat_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  setupPushNotifications() async {
    final x = FirebaseMessaging.instance;
    await x.requestPermission();
    
    String? token = await x.getToken();
    print("Token ==== $token");
  }

  @override
  void initState() {
    // initState'de async işlem yapılmaz flutter istemiyor.

    super.initState();
    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat app"),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: Column(
        children: const [Expanded(child: ChatMessages()), NewMessage()],
      ),
    );
  }
}
