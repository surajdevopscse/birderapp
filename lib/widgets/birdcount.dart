import 'package:birderapp/models/birdlist_changenotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirdCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BirdListChangeNotifier>(
      builder: (ctx, birdlistCNInstance, widget) => Container(
        margin: EdgeInsets.all(20.0),
        child: Text(
          'Total Birds : ${birdlistCNInstance.listofbirds.length}',
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900]),
        ),
      ),
    );
  }
}
