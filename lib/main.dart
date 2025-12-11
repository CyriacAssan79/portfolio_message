import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_message/api/notification_manager.dart';
import 'package:portfolio_message/services/notification_service.dart';
import 'package:portfolio_message/view/pages/home.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? token = await messaging.getToken();
  print("FCM Token: $token");

  //Notification manuelle de firebase à mon app (test)
  //Dans le fichier notification_service.dart
  await NotificationService.initialize();

  //Notification automatique de mon portfolio à mon app
  //Dans le fichier notification_manager.dart
  await PushNotificationManager().initEtEnvoiTokenAuServer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Mes messages portfolio'),
    );
  }
}
