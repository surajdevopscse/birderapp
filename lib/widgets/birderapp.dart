import 'package:birderapp/screens/add_new_bird_screen.dart';
import 'package:birderapp/widgets/bird_list_with_listview.dart';
// import 'package:birderapp/widgets/birdcount.dart';
import 'package:flutter/material.dart';

class BirderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birder App'),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: BirdListWithListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to AddNewBirdScreen !
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewBird(),
            ),
          );
        },
        backgroundColor: Colors.teal[700],
        child: Icon(Icons.add),
      ),
    );
  }
}
