import 'package:birderapp/screens/add_new_bird_screen.dart';
import 'package:birderapp/screens/localization_bird.dart';
import 'package:birderapp/widgets/bird_list_listviewbuilder.dart';
import 'package:birderapp/widgets/bird_list_with_listview.dart';
import 'package:birderapp/widgets/birder_drawer.dart';
// import 'package:birderapp/widgets/birdcount.dart';
import 'package:flutter/material.dart';

class BirderApp extends StatelessWidget {
  static final String routeName = '/home';
  void navigateToAddNewBirdScreen(BuildContext context) async {
    var result = await Navigator.pushNamed(context, AddNewBird.routeName);
    if (result == "success") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Bird added successfully!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BirderDrawer(),
      appBar: AppBar(
        title: Text('Birder App'),
        centerTitle: true,
        //backgroundColor: Colors.green,
      ),
      body: ListViewBuilder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to AddNewBirdScreen !
          navigateToAddNewBirdScreen(context);
        },
        //backgroundColor: Colors.teal[700],
        child: Icon(Icons.add),
      ),
    );
  }
}
