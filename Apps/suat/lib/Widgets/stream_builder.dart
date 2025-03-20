import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamBuil extends StatefulWidget {
  StreamBuil({super.key});
  @override
  State<StreamBuil> createState() {
    return _streamBuil();
  }
}

class _streamBuil extends State<StreamBuil> {
  final store = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final phones = store.collection('Phones');

    return StreamBuilder(
      stream: phones.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          //suat kaya
          return Text("Error");
        } else if (snapshot.hasData) {
          final listem = snapshot.data!.docs;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  trailing: IconButton(
                    onPressed: () async {
                      await listem[index].reference.delete();
                    },
                    icon: Icon(Icons.delete),
                  ),

                  subtitle: Row(
                    children: [
                      Text(
                        listem[index].data()['model'].toString(),
                        style: TextStyle(fontSize: 23),
                      ),
                      Text(
                        listem[index].data()['brand'].toString(),
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                  title: Text(
                    listem[index].data()['year'].toString(),
                    style: TextStyle(fontSize: 23),
                  ),
                ),
              );
            },
            itemCount: listem.length,
          );
        } else {
          return Text("No file");
        }
      },
    );
  }
}
