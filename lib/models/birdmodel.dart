class BirdModel {
  final int? id;
  final String? name;
  final String? scientificName;
  final String? imageUrl;
  final String? info;
  int? likes = 0;
  bool? isFavrite = false;

  BirdModel(
      {this.id,
      this.name,
      this.scientificName,
      this.imageUrl,
      this.info,
      this.likes,
      this.isFavrite});
  factory BirdModel.fromJSON(Map<String, dynamic> jsonData) {
    return BirdModel(
        id: jsonData["id"],
        name: jsonData["name"],
        scientificName: jsonData["scientificName"],
        imageUrl: jsonData["imageUrl"],
        info: jsonData['info'],
        likes: jsonData['likes'],
        isFavrite: jsonData['isFavrite']);
  }
}
