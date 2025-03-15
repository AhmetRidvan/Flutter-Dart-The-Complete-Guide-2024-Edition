import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
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
                  index + 1 < //0,1,2,3,4,5,6,7,8,9 //length 10 liste kadar sonraki soruyu kontrol ediyor.
                          loadedMessages.length
                      ? loadedMessages[index + 1]
                      : null; //listenin uzunluğu kadar hamle yapıyım; // 5:50
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

    