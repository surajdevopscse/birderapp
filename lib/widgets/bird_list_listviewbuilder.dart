import 'package:birderapp/models/birdlist_changenotifier.dart';
import 'package:birderapp/screens/add_new_bird_screen.dart';
import 'package:birderapp/screens/birddetails_with_silver.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewBuilder extends StatefulWidget {
  @override
  _ListViewBuilderState createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  void initState() {
    super.initState();
    Provider.of<BirdListChangeNotifier>(context, listen: false).getAllBirds();
  }

  void detailsShow(bird) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BirdDetailsWithSilver(
            theBird: bird,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BirdListChangeNotifier>(
      builder: (_, birdlistCNInstance, __) => ListView.builder(
          itemCount: birdlistCNInstance.listofbirds.length,
          itemBuilder: (BuildContext context, int index) {
            return birdlistCNInstance.listofbirds.length > 0
                ? Card(
                    child: ListTile(
                        leading: InkWell(
                          onTap: () {
                            detailsShow(birdlistCNInstance.listofbirds[index]);
                          },
                          child: Image.network(
                            '${birdlistCNInstance.listofbirds[index].imageUrl}',
                          ),
                        ),
                        subtitle: Text(
                            '${birdlistCNInstance.listofbirds[index].scientificName}'),
                        trailing: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                birdlistCNInstance.deleteABird(
                                    birdlistCNInstance.listofbirds[index]);
                              },
                              child:
                                  Icon(Icons.delete_forever, color: Colors.red),
                            ),
                            InkWell(
                              onTap: () {
                                print('U tapped !On Edit ?');
                              },
                              child: Icon(Icons.edit, color: Colors.green),
                            ),
                          ],
                        ),
                        title: Text(
                          '${birdlistCNInstance.listofbirds[index].name}',
                        )),
                  )
                : Text('Data Not Found');
          }),
    );
  }
}
