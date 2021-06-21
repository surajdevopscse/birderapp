import 'package:birderapp/models/birdlist_changenotifier.dart';
import 'package:birderapp/models/birdmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirdDetails extends StatefulWidget {
  final BirdModel theBird;
  BirdDetails({required this.theBird});

  @override
  _BirdDetailsState createState() => _BirdDetailsState();
}

class _BirdDetailsState extends State<BirdDetails> {
  bool isFavorite = false;
  void changeFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Consumer<BirdListChangeNotifier>(
        builder: (context, instanceCN, child) => Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'birdHeroFly-${widget.theBird.id}',
                  child: Image.network('${widget.theBird.imageUrl}'),
                ),
                ListTile(
                  title: Text(
                    '${widget.theBird.name}',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${widget.theBird.scientificName}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: changeFavorite,
                        child: Icon(
                          isFavorite == true
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: Colors.red[900],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 18.0),
                        child: Column(
                          children: <Widget>[
                            Text('${widget.theBird.likes}'.toString()),
                            InkWell(
                              child: Icon(
                                Icons.thumb_up_outlined,
                                color: Colors.blue,
                              ),
                              onTap: () {
                                instanceCN.incrementLikes(widget.theBird);
                                // print(widget.theBird.likes);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '${widget.theBird.info}',
                    style: TextStyle(
                        color: Colors.grey[700], height: 1.5, fontSize: 18.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
