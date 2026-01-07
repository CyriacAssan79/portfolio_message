import 'package:http/http.dart' as http;
import 'package:portfolio_message/model/certifications_model.dart';
import 'dart:convert';

class DiplomeAPI {
  String baseUrl = "https://portfolio-zskn.vercel.app/api/diplomes";

  Future<List<CertificationsModel>> callAPI() async {
    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body); // <-- liste
      List<CertificationsModel> diplome = data
          .map((jsonItem) => CertificationsModel.fromJson(jsonItem))
          .toList();
      return diplome;
    } else {
      throw Exception("Erreur de connexion");
    }
  }

  Future<Map<String, dynamic>> savedDiplome(
      title,
      structure,
      annee,
      url,
      ) async {
    final uri = Uri.parse(baseUrl);

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "structure": structure,
        "annee": annee,
        "url": url,
      }),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception("Erreur de connexion : ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> delDiplome(id) async {
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
