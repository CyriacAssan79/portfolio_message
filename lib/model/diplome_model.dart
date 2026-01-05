class DiplomeModel {
  String id;
  String title;
  String structure;
  int annee;
  String url;

  DiplomeModel({
    required this.id,
    required this.title,
    required this.structure,
    required this.annee,
    required this.url,
  });

  DiplomeModel.fromJson(Map<String, dynamic> json):
      id = json['_id'],
      title = json['title'],
      structure = json['structure'],
      annee = json['annee'],
      url = json['url'];
}
