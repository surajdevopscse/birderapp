import 'dart:convert';

import 'package:birderapp/models/birdmodel.dart';
import 'package:http/http.dart' as http;

class BirdsService {
  // addABirdtoFirebaseDB()
  // getAllBirds()

  Future<String> addABirdtoFirebaseDB(BirdModel newBird) async {
    try {
      // do not hard code urls is bad practise ! Instead accept them as parameters
      const _domainString =
          "sapientbirderapp-default-rtdb.asia-southeast1.firebasedatabase.app";
      const _urlString = "birds.json";
      Uri url = Uri.https(_domainString, _urlString);
      var response = await http.post(
        url,
        body: json.encode({
          "id": newBird.id,
          "name": newBird.name,
          "scientificName": newBird.scientificName,
          "likes": newBird.likes,
          "info": newBird.info,
          "imageUrl": newBird.imageUrl,
          "isFavrite": newBird.isFavrite,
        }),
      );

      if (response.statusCode == 200) {
        print('Bird Inserted !');
        return "Success";
      }
    } catch (e) {
      print(e);
      return "Error";
    }
    return "erorr";
  }

  Future<List<BirdModel>> get getDataFromFirebase async {
    final List<BirdModel> loadedBirds = [];
    try {
      // do not hard code urls is bad practise ! Instead accept them as parameters
      const _domainString =
          "sapientbirderapp-default-rtdb.asia-southeast1.firebasedatabase.app";
      const _urlString = "birds.json";
      Uri url = Uri.https(_domainString, _urlString);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('Birds Recived !');
        var extractedBirds = jsonDecode(response.body) as Map<String, dynamic>;
        extractedBirds.forEach((birdUniqueId, eachBird) {
          loadedBirds.add(BirdModel.fromJSON(eachBird));
        });
        return loadedBirds;
      }
    } catch (e) {
      print(e);
    }
    return loadedBirds;
  }
}
