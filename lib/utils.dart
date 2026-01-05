import 'package:flutter/material.dart';

enum SnackType { success, error, info, warning }

class AppSnackBar {
  static void show(
      BuildContext context, {
        required String message,
        SnackType type = SnackType.info,
      }) {
    Color color;

    switch (type) {
      case SnackType.success:
        color = Colors.green;
        break;
      case SnackType.error:
        color = Colors.red;
        break;
      case SnackType.warning:
        color = Colors.orange;
        break;
      default:
        color = Colors.blue;
    }

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
