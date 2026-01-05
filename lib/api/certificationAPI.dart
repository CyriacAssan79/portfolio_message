import 'package:http/http.dart' as http;
import 'package:portfolio_message/model/certifications_model.dart';
import 'dart:convert';

class CertificationAPI {
  String baseUrl = "https://portfolio-zskn.vercel.app/api/certifications";

  Future<List<CertificationsModel>> callAPI() async {
    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body); // <-- liste
      List<CertificationsModel> certification = data
          .map((jsonItem) => CertificationsModel.fromJson(jsonItem))
          .toList();
      return certification;
    } else {
      throw Exception("Erreur de connexion");
    }
  }

  Future<Map<String, dynamic>> savedCertification(
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

  Future<Map<String, dynamic>> delCertification(id) async {
    final uri = Uri.parse(baseUrl);

    final response = await http.delete(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": id}),
    );
    print("object");
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception("Erreur de connexion : ${response.statusCode}");
    }
  }
}
