// class GenreModel
// class to handle data from json and mapping data genre
class GenreModel {
  String? id;
  String? genreName;

  GenreModel(this.id, this.genreName);

  GenreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    genreName = json['name'];
  }
}
