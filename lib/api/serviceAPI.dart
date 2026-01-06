import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:portfolio_message/model/service_model.dart';

class ServiceAPI{
  String baseUrl = "https://portfolio-zskn.vercel.app/api/services";

  Future<List<ServiceModel>> callAPI() async {
    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body); // <-- liste
      print(data);
      List<ServiceModel> services = data
          .map((jsonItem) => ServiceModel.fromJson(jsonItem))
          .toList();
      return services;
    } else {
      throw Exception("Erreur de connexion");
    }
  }

  Future<Map<String, dynamic>> savedService(
      title,
      description,
      icon,
      ) async {
    final uri = Uri.parse(baseUrl);

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "description": description,
        "icon": icon,
      }),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception("Erreur de connexion : ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> delService(id) async {
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