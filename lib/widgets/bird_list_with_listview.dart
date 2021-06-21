import 'package:birderapp/models/birdlist_changenotifier.dart';
import 'package:birderapp/screens/bird_details_screen.dart';
import 'package:birderapp/widgets/birdcount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirdListWithListView extends StatefulWidget {
  @override
  _BirdListWithListViewState createState() => _BirdListWithListViewState();
}

class _BirdListWithListViewState extends State<BirdListWithListView> {
  void initState() {
    super.initState();
    Provider.of<BirdListChangeNotifier>(context, listen: false).getAllBirds();
  }

  void detailsShow(bird) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BirdDetails(
            theBird: bird,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BirdListChangeNotifier>(
      builder: (_, birdlistCNInstance, __) => ListView(
        children: <Widget>[
          ...birdlistCNInstance.listofbirds.map(
            // will change (comes from ChangeNotifier)
            (bird) => GestureDetector(
              onHorizontalDragEnd: (_) {
                // print('U dragged !');
                birdlistCNInstance.deleteABird(
                    bird); // will change (comes from ChangeNotifier)
              },
              child: Card(
                elevation: 10,
                child: ListTile(
                  leading: InkWell(
                    onTap: () {
                      detailsShow(bird);
                    },
                    child: Image(
                      width: 100.0,
                      fit: BoxFit.fitWidth,
                      image: NetworkImage('${bird.imageUrl}'),
                    ),
                  ),
                  title: Text(
                    '${bird.name}',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  subtitle: Text(
                    '${bird.scientificName}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  trailing: InkWell(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red[500],
                    ),
                    onTap: () {
                      // print('U tapped ! But have u tapped ur potential ?');
                      birdlistCNInstance.deleteABird(bird);
                    },
                  ),
                ),
              ),
            ),
          ),
          BirdCount()
        ],
      ),
    );
  }
}
