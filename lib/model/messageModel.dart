class MessageModel {
  String id;
  String name;
  String email;
  String message;
  bool state;

  MessageModel({
    required this.id,
    required this.name,
    required this.email,
    required this.message,
    required this.state,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
    : id = json['_id'],
      name = json['name'],
      email = json['email'],
      message = json['message'],
      state = json['statut'];
}
