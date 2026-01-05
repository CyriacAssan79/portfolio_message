class CompetenceModel {
  String id, name, type;

  CompetenceModel({required this.id, required this.name, required this.type});

  CompetenceModel.fromJson(Map<String, dynamic> json) :
    id = json['_id'],
    name = json['name'],
    type = json['type'];
}
