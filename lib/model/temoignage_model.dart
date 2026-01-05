class TemoignageModel {
  String id,name, email, message, photo;

  TemoignageModel({
    required this.id,
    required this.name,
    required this.email,
    required this.message,
    required this.photo,
  });

  TemoignageModel.fromJson(Map<String, dynamic> json):
      id = json['_id'],
      name = json['name'],
      email = json['email'],
      message = json['message'],
      photo = json['photo'];
}
