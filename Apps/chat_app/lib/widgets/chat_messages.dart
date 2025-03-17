import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance
              .collection('chat')
              .orderBy('createdAt', descending: true)
              .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No messages!"));
        } else if (snapshot.hasError) {
          return Center(child: Text("Something went wrong!"));
        } else {
          final loadedMessages = snapshot.data!.docs; // map'ler
          return ListView.builder(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 15),
            reverse: true,
            itemCount: loadedMessages.length,
            itemBuilder: (context, index) {
              final chatMessages = loadedMessages[index];
              final nextChatMessages =
                  index + 1 < loadedMessages.length
                      ? loadedMessages[index + 1]
                      : null;
              final currentMessageUserId = chatMessages['userId'];
              final nextMessageUserId =
                  nextChatMessages != null ? nextChatMessages['userId'] : null;
              final nextUserIsSame = currentMessageUserId == nextMessageUserId;

              if (nextUserIsSame) {  
                //ilk mesaj mı ?
                return MessageBubble.next(
                  message: chatMessages['text'],
                  isMe:
                      authenticatedUser!.uid ==
                      currentMessageUserId, //benim mesajım mı   // isFirstInSequence
                );
              } else {
                return MessageBubble.first(
                  userImage: chatMessages['userImage'],
                  username: chatMessages['username'],
                  message: chatMessages['text'],
                  isMe: authenticatedUser!.uid == currentMessageUserId,
                );
              }
            },
          );
        }
      },
    );
  }
}














/*
sıradakiMesaj = chatList[index + 1]
Mesaj = chatList[index]
chatList = merhaba
nasılsın
iyi misin
umarım iyisindir
*/









       // index + 1 sonraki mesaj
                  // <             items = 5, 0,1,2,3,4

                  /*
          1        6 tane map var 

                  */

    