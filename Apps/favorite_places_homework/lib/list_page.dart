import 'package:favorite_places/data/List_data.dart';
import 'package:favorite_places/deneme.dart';
import 'package:favorite_places/new_item.dart';
import 'package:favorite_places/state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});
  @override
  ConsumerState<ListPage> createState() {
    return _ListPage();
  }
}

class _ListPage extends ConsumerState<ListPage> {
  @override
  Widget build(BuildContext context) {
    final places = ref.watch(ListProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ModelPage(
                    p1: places[index],
                  );
                },
              ));
            },
            child: Card(
              child: Text(
                places[index].title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context).push<bool>(MaterialPageRoute(
                  builder: (context) {
                    return NewItem();
                  },
                ));
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
