import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PushNotificationManager {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initEtEnvoiTokenAuServer() async {
    //Activer la notif pour iphone
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    //Récupérer le token
    String? token = await _messaging.getToken();
    if (token != null) {
      print('FCM Token: $token');
      await sendTokenToBackend(token);
    }

    //Ecouter les tokens refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      sendTokenToBackend(newToken);
    });

    //Gestion des message en foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message reçu en foreground: ${message.notification?.title}');
    });

    //Cliquer sur la notification pour ouvrir l'app
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
  }

  Future<void> sendTokenToBackend(String token) async {
    final url = Uri.parse(
      'https://portfolio-zskn.vercel.app/api/register',
    );
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"token": token}),
    );
    if(response.statusCode ==200){
      print('Token enregistré côté serveur');
    }
    else{
      print('Erreur lors de l\'enregistrement du token côté serveur');
    }
  }
}
