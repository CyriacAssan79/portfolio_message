class ServiceModel {
  String id, title, description,icon;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });

  ServiceModel.fromJson(Map<String, dynamic> json):
      id = json['_id'],
      title = json['title'],
      description = json['description'],
      icon = json['icon'];
}
