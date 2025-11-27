import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:portfolio_message/model/messageModel.dart';
class ApiServices {
  String baseUrl = "https://portfolio-zskn.vercel.app/api/contact";

  Future<List<MessageModel>> callAPI() async {
    final uri = Uri.parse(baseUrl);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body); // <-- liste
      List<MessageModel> messages = data
          .map((jsonItem) => MessageModel.fromJson(jsonItem))
          .toList();
      return messages;
    } else {
      throw Exception("Erreur de connexion");
    }
  }

  Future<Map<String, dynamic>> readMessage(
      id
      ) async {
    final uri = Uri.parse(baseUrl);

    final response = await http.put(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": id,
        "statut": true,
      }),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception("Erreur de connexion : ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> delMessage(
      id
      ) async {
    final uri = Uri.parse(baseUrl);

    final response = await http.delete(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "id": id
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
