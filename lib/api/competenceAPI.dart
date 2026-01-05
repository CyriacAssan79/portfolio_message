import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:portfolio_message/model/competence_model.dart';

class CompetenceAPI {
  String baseUrl = "https://portfolio-zskn.vercel.app/api/competence";

  Future<List<CompetenceModel>> callAPI() async {
    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body); // <-- liste
      List<CompetenceModel> competence = data
          .map((jsonItem) => CompetenceModel.fromJson(jsonItem))
          .toList();
      return competence;
    } else {
      throw Exception("Erreur de connexion");
    }
  }

  Future<Map<String, dynamic>> savedCompetence(name, type) async {
    final uri = Uri.parse(baseUrl);

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "type": type}),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception("Erreur de connexion : ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> delCompetence(id) async {
    final uri = Uri.parse(baseUrl);

    final response = await http.delete(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": id}),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception("Erreur de connexion : ${response.statusCode}");
    }
  }
}
