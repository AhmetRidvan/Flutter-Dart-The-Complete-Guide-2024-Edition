import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() {
    return _NewMessageState();
  }
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController t1 = TextEditingController();

  @override
  void dispose() {
    t1.dispose(); //bellekte kapladığı kaynakların geri alınmasına yarıyor.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              enableSuggestions: true,
              autocorrect: true,
              decoration: InputDecoration(labelText: "Sende a message.."),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
