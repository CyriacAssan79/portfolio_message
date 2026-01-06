class SocialModal {
  String id, wha, email, lk, github, tel;

  SocialModal({
    required this.id,
    required this.wha,
    required this.email,
    required this.lk,
    required this.github,
    required this.tel,
  });

  SocialModal.fromJson(Map<String, dynamic> json):
      id = json['_id'],
      wha = json['wha'],
      email = json['email'],
      lk = json['lk'],
      github = json['github'],
      tel = json['tel'];
}
