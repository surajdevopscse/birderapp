import 'package:birderapp/models/birdmodel.dart';
import 'package:flutter/cupertino.dart';

class BirdListChangeNotifier extends ChangeNotifier {
  final List<BirdModel> listofbirds = [
    BirdModel(
      id: 1,
      name: 'Hornbill',
      scientificName: 'Bucerotidae',
      likes: 100,
      imageUrl:
          'https://425a4737ivmv4froj2qpw6u1-wpengine.netdna-ssl.com/wp-content/uploads/2018/07/main-aviary-great-indian-hornbill-2012.jpg',
    ),
    BirdModel(
      id: 2,
      name: 'Humming Bird',
      scientificName: 'Trochilidae',
      likes: 200,
      imageUrl:
          'https://www.thespruce.com/thmb/6oqkvxm2kUj6Krf05h7X4qy47fU=/1500x844/smart/filters:no_upscale()/annas-d97a9a5f0321476098e7917726d2366d.jpg',
    ),
    BirdModel(
      id: 3,
      name: 'Kingfisher',
      scientificName: 'Alcedinidae',
      likes: 500,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/7/72/Alcedo_azurea_-_Julatten.jpg',
    ),
  ];

  void deleteABird(BirdModel bird) {
    listofbirds.removeWhere((theBird) => bird.id == theBird.id);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void addNewBirdToList(BirdModel newBird) {
    listofbirds.add(newBird);
    notifyListeners();
  }
}
