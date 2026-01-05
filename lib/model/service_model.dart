class ServiceModel {
  String id, title, desciption;

  ServiceModel({
    required this.id,
    required this.title,
    required this.desciption,
  });

  ServiceModel.fromJson(Map<String, dynamic> json):
      id = json['_id'],
      title = json['title'],
      desciption = json['desciption'];
}
