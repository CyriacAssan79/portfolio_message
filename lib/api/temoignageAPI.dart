import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:portfolio_message/model/temoignage_model.dart';

class TemoignageAPI {
  String baseUrl = "https://portfolio-zskn.vercel.app/api/temoignages";

  Future<List<TemoignageModel>> callAPI() async {
    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body); // <-- liste
      List<TemoignageModel> temoignages = data
          .map((jsonItem) => TemoignageModel.fromJson(jsonItem))
          .toList();
      return temoignages;
    } else {
      throw Exception("Erreur de connexion");
    }
  }

  Future<Map<String, dynamic>> delTemoignage(id) async {
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
