import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:portfolio_message/model/social_model.dart';

class SocialAPI{

  String baseUrl = "https://portfolio-zskn.vercel.app/api/socials";

  Future<List<SocialModal>> callAPI() async {
    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body); // <-- liste
      List<SocialModal> social = data
          .map((jsonItem) => SocialModal.fromJson(jsonItem))
          .toList();
      return social;
    } else {
      throw Exception("Erreur de connexion");
    }
  }

  Future<Map<String, dynamic>> updatedSocial(
      id,
      wha,
      email,
      lk,
      github,
      tel,
      ) async {
    final uri = Uri.parse(baseUrl);

    final response = await http.put(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": id,
        "wha": wha,
        "email": email,
        "lk": lk,
        "github": github,
        "tel": tel,
      }),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception("Erreur de connexion : ${response.statusCode}");
    }
  }

}