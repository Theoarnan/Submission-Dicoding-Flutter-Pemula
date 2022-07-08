// class CastModel
// class to handle data from json and mapping data cast
class CastModel {
  String? id;
  String? photo;
  String? nameCast;

  CastModel(this.id, this.photo, this.nameCast);

  CastModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCast = json['name'];
    photo = json['photo_path'];
  }
}
